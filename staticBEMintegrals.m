function [gIntStatic, DgIntStatic] = staticBEMintegrals(mesh, quadOrder, verbosity, waitBar)
%% evaluates reaction integrals for the g and n \cdot \nabla g
% This function evaluates both reaction integrals for pressure integral equation.
% First integration in reaction integrals is made analytically and provides 
% singularity treatment.
% Normal belongs to the source coordinate and \nabla refers to observation coordinates
% Only static part of the Green's function is integrated.
%
% INPUTS
%  mesh: AToM stucture containing mesh
%  quadOrder: quadrature order, integer (1-12) [1 x 1]
%  verbosity: amount of information shown, integer (0,1,2,3) [1 x 1]
%  waitBar: AToM waitbar object

% OUTPUTS
%  gIntStatic: reaction integrals for the g, double [Ntria x Ntria]
%  DgIntStatic: reaction integrals for the g, double [Ntria x Ntria]
%
% SYNTAX
% 
% [gIntStatic, DgIntStatic] = staticBEMintegrals(mesh, quadOrder, verbosity, waitBar)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz                                   

%% waitbar initialization

if ~exist('waitBar', 'var') || isempty(waitBar)
   if verbosity
      waitBar = models.utilities.graphics.Waitbar(0, ...
         'acoustic BEM: static triangular integrals', 0, [10 10 350 25], 0);
   else
      hFigure = figure('Visible', 'off');  % invisible windows for
      waitBar = models.utilities.graphics.Waitbar(hFigure, ... invisible waitbar
         'acoustic BEM: static triangular integrals', 0, [10 10 350 25], 0);
   end
else
   waitBar.update(0);
end


%% triangular parameters
TriaArea = mesh.triangleAreas;
p1 = mesh.nodes(mesh.connectivityList(:,1),:);
p2 = mesh.nodes(mesh.connectivityList(:,2),:);
p3 = mesh.nodes(mesh.connectivityList(:,3),:);
Ntria = mesh.nTriangles;

% allocation
gIntStatic  = zeros(Ntria, Ntria);
DgIntStatic  = zeros(Ntria, Ntria);

%% static tria-tria integrals 
% gIntStatic = Integrate[ Integrate[ 1/R ] ]
% DgIntStatic = Integrate[ D/Dn Integrate[ 1/R ] ]
% Normal belongs to source side.
% Derivative is made with respect to observation coordinates.

% integration points and weights
[x, y, z, weights, Nquadpoints, Ntria] = ...
    models.utilities.simplexIntegration.triaQuad(p1, p2, p3, quadOrder);
weights = 2*weights; % sum(weights) = 1

% local coordinate systems
% unit vectors ( the u - v - w system )
[u , v , w] = models.solvers.singularities.triaRWG.coordsUvWbasis ...
    (p1, p2, p3, TriaArea);

% unit vectors ( the s - m - w system )
[s1, m1, s2, m2, s3, m3] = ...
    models.solvers.singularities.triaRWG.coordsSmBasis(p1, p2, p3, w);

%% quadrature
for iQuad = 1:Nquadpoints
    weight = weights(iQuad, 1);
    for iObserv = 1:Ntria
        waitBar.update(((iQuad-1)*Ntria + iObserv) / (Nquadpoints*Ntria));
        
        % observation point
        rObs = [x(iObserv,iQuad), y(iObserv,iQuad), z(iObserv,iQuad)];
        
        % 1/R integral
        [S, ~, ~] = models.solvers.singularities.triaRWG.ints(...
            rObs, ...
            p1, p2, p3, Ntria, u , v , w, s1, m1, s2, m2, s3, m3);

        % Careful, the discontinuity of the normal derivative was removed by
        % assumption that as w0 -> 0 we are always outside of the surface.
        % This is in line with the applied impedance boundary condition
        % which is applied at w0 -> 0+
        [dS] = getDStaticGreenOverDn(rObs, p1, p2, p3, Ntria, u , v , w, ...
        s1, m1, s2, m2, s3, m3);

        gIntStatic(iObserv,:) = gIntStatic(iObserv,:) + S.'*weight;
        DgIntStatic(iObserv,:) = DgIntStatic(iObserv,:) + dS.'*weight;
    end
end

% ints function assumes G = 1 / R, while integral equation assumes G = 1/(4*pi*R)
gIntStatic = gIntStatic/(4*pi).*repmat(mesh.triangleAreas,[1,mesh.nTriangles]);
DgIntStatic = DgIntStatic/(4*pi).*repmat(mesh.triangleAreas,[1,mesh.nTriangles]);

end