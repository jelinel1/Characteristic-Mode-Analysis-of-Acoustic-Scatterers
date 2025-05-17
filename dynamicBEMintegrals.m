function [gIntDynamic, DgIntDynamic] = dynamicBEMintegrals(mesh, quadOrder, k0, verbosity, waitBar)
%% evaluates reaction integrals for the g and n \cdot \nabla g
% This function evaluates both reaction integrals for pressure integral equation.
% Normal belongs to the source coordinate and \nabla refers to observation coordinates
% Both integrations are numerical.
% Only regular part of the Green's function is integrated.
%
% INPUTS
%  mesh: AToM stucture containing mesh
%  quadOrder: quadrature order, integer (1-12) [1 x 1]
%  k0: freespace wavenumber, double [1 x 1]
%  verbosity: amount of information shown, integer (0,1,2,3) [1 x 1]
%  waitBar: AToM waitbar object

% OUTPUTS
%  gIntDynamic: reaction integrals for the g, double [Ntria x Ntria]
%  DgIntDynamic: reaction integrals for the g, double [Ntria x Ntria]
%
% SYNTAX
%
% [gIntDynamic, DgIntDynamic] = dynamicBEMintegrals(mesh, quadOrder, verbosity, waitBar)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz

%% waitbar initialization

if ~exist('waitBar', 'var') || isempty(waitBar)
    if verbosity
        waitBar = models.utilities.graphics.Waitbar(0, ...
            'acoustic BEM: dynamic triangular integrals', 0, [10 10 350 25], 0);
    else
        hFigure = figure('Visible', 'off');  % invisible windows for
        waitBar = models.utilities.graphics.Waitbar(hFigure, ... invisible waitbar
            'acoustic BEM: dynamic triangular integrals', 0, [10 10 350 25], 0);
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
gIntDynamic  = zeros(Ntria, Ntria);
DgIntDynamic  = zeros(Ntria, Ntria);

minEdgLength = min(mesh.triangleEdgeLengths);

%% dynamic tria-tria integrals
% gIntDynamic = Integrate[ Integrate[ Exp(-jkR)/R - 1/R ] ]
% DgIntDynamic = Integrate[ D/Dn Integrate[ Exp(-jkR)/R - 1/R ] ]
% Normal belongs to source side.
% Derivative is made with respect to observation coordinates.

% integration points and weights
[xq, yq, zq, weights, Nquadpoints, Ntria] = ...
    models.utilities.simplexIntegration.triaQuad(p1, p2, p3, quadOrder);
weights = 2*weights; % sum(weights) = 1

weights = repmat(weights.',[Ntria,1]);
nx = repmat(mesh.triangleNormals(:,1),[1,Nquadpoints]);
ny = repmat(mesh.triangleNormals(:,2),[1,Nquadpoints]);
nz = repmat(mesh.triangleNormals(:,3),[1,Nquadpoints]);

%% quadrature

for iObserv = 1:Ntria
    for iQuad = 1:Nquadpoints
        weight = weights(1,iQuad);

        waitBar.update(((iObserv-1)*Nquadpoints + iQuad) / (Nquadpoints*Ntria));

        int1 = sum(greenReg(xq(iObserv,iQuad), yq(iObserv,iQuad), zq(iObserv,iQuad), ...
            xq, yq, zq).*weights,2).*TriaArea;
        int2 = sum(DngreenReg(xq(iObserv,iQuad), yq(iObserv,iQuad), zq(iObserv,iQuad), ...
            xq, yq, zq, nx, ny, nz).*weights,2).*TriaArea;

        gIntDynamic(iObserv,:) = gIntDynamic(iObserv,:) + int1.'*weight;
        DgIntDynamic(iObserv,:) = DgIntDynamic(iObserv,:) + int2.'*weight;
    end
end

% int1,2 functions assumes G = exp(-1i*k0*R) / R, while integral equation assumes G = exp(-1i*k0*R) / (4*pi*R)
gIntDynamic = gIntDynamic/(4*pi).*repmat(TriaArea,[1,mesh.nTriangles]);
DgIntDynamic = DgIntDynamic/(4*pi).*repmat(TriaArea,[1,mesh.nTriangles]);


% regular part of Green's function
    function out = greenReg(x,y,z,xc,yc,zc)
        Rx = x - xc;
        Ry = y - yc;
        Rz = z - zc;
        R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
        out = (exp(-1i*k0*R) - 1)./R;
        outTmp = k0*(-1i - k0*R/2 + 1i*(k0*R).^2/6); % small argument
        ind = (k0*R < 4e-4); % best precision from both
        out(ind) = outTmp(ind);
    end
    % function out = greenReg(x,y,z,xc,yc,zc)
    %     Rx = x - xc;
    %     Ry = y - yc;
    %     Rz = z - zc;
    %     R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
    %     out = 1./R;
    % end

% regular part of normal derivative of Green's function
    function out = DngreenReg(x,y,z,xc,yc,zc,nx,ny,nz)
        Rx = x - xc;
        Ry = y - yc;
        Rz = z - zc;
        R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
        dirCos = (nx.*Rx + ny.*Ry + nz.*Rz)./R;

        % For coinciding points it is assumed that observation point
        % approaches against the normal. The impedance boundary condition
        % is applied just outside the surface.
        ind = (R == 0);
        dirCos(ind) = 1;

        out = ( 1 - (1 + 1i*k0*R).*exp(-1i*k0*R) ) ./ R.^2;
        outTmp = k0^2*(- 1 + 2*1i*k0*R/3 + (k0*R).^2/4 )/2; % small argument
        ind = (k0*R < 1.5e-3); % best precision from both
        out(ind) = outTmp(ind);
        out = out.*dirCos;
    end

    % function out = DngreenReg(x,y,z,xc,yc,zc,nx,ny,nz)
    %     Rx = x - xc;
    %     Ry = y - yc;
    %     Rz = z - zc;
    %     R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
    %     dirCos = (nx.*Rx + ny.*Ry + nz.*Rz)./R;
    % 
    %     % For coinciding points it is assumed that observation point
    %     % approaches against the normal. The impedance boundary condition
    %     % is applied just outside the surface.
    %     ind = (R == 0);
    %     dirCos(ind) = 1;
    % 
    %     out = -dirCos./R.^2;
    % end

end