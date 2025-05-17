function [Np, Ndp] = pScatt(mesh, quadOrder, k0, rObs, verbosity, waitBar)
%% evaluates scattered pressure in BEM
% This function evaluates scattered presure outside of the source region
% using numerical quadrature. Singularity is not treated.
% pScatt(iObs) = sum(Np(iObs,n)*p(n,1)) + sum(Ndp(iObs,n)*dp(n,1))
% where p is the boundary pressure and dp is normal derivative of surface
% pressure using outer normal.
%
% INPUTS
%  mesh: AToM stucture containing mesh
%  quadOrder: quadrature order, integer (1-12) [1 x 1]
%  k0: freespace wavenumber, double [1 x 1]
%  rObs: observation point, double [nObs x 3]
%  verbosity: amount of information shown, integer (0,1,2,3) [1 x 1]
%  waitBar: AToM waitbar object
%
% OUTPUTS
%  Np: matrix allowing evaluation of scattered pressure, double [nObs x Ntria]
%  Ndp: matrix allowing evaluation of scattered pressure, double [nObs x Ntria]
%
% SYNTAX
%
% [Np, Ndp] = pScatt(mesh, quadOrder, k0, rObs, verbosity, waitBar)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz

%% waitbar initialization

if ~exist('waitBar', 'var') || isempty(waitBar)
    if verbosity
        waitBar = models.utilities.graphics.Waitbar(0, ...
            'acoustic BEM: pressure near field', 0, [10 10 350 25], 0);
    else
        hFigure = figure('Visible', 'off');  % invisible windows for
        waitBar = models.utilities.graphics.Waitbar(hFigure, ... invisible waitbar
            'acoustic BEM: pressure near field', 0, [10 10 350 25], 0);
    end
else
    waitBar.update(0);
end

%%

nObs = size(rObs,1); % number of pbservation points

%% triangular parameters
TriaArea = mesh.triangleAreas;
p1 = mesh.nodes(mesh.connectivityList(:,1),:);
p2 = mesh.nodes(mesh.connectivityList(:,2),:);
p3 = mesh.nodes(mesh.connectivityList(:,3),:);
Ntria = mesh.nTriangles;

% allocation
Np  = zeros(nObs, Ntria);
Ndp  = zeros(nObs, Ntria);

%% tria integrals from Green's function and its normal derivative
% Normal belongs to source side

% integration points and weights
[xq, yq, zq, weights, Nquadpoints, Ntria] = ...
    models.utilities.simplexIntegration.triaQuad(p1, p2, p3, quadOrder);
weights = 2*weights; % sum(weights) = 1

weights = repmat(weights.',[Ntria,1]);

% this should be outer normal
nx = repmat(mesh.triangleNormals(:,1),[1,Nquadpoints]);
ny = repmat(mesh.triangleNormals(:,2),[1,Nquadpoints]);
nz = repmat(mesh.triangleNormals(:,3),[1,Nquadpoints]);

%% quadrature

for iObserv = 1:nObs
    waitBar.update(iObserv / nObs);
    int1 = sum(green(rObs(iObserv,1), rObs(iObserv,2), rObs(iObserv,3), ...
        xq, yq, zq).*weights,2).*TriaArea;
    int2 = sum(Dngreen(rObs(iObserv,1), rObs(iObserv,2), rObs(iObserv,3), ...
        xq, yq, zq, nx, ny, nz).*weights,2).*TriaArea;

    Np(iObserv, :) = int2;
    Ndp(iObserv, :) = int1;
end

% int1,2 functions assume G = exp(-1i*k0*R) / R
Np = Np/(4*pi);
Ndp = - Ndp/(4*pi);

%   Green's function
    function out = green(x,y,z,xc,yc,zc)
        Rx = x - xc;
        Ry = y - yc;
        Rz = z - zc;
        R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
        out = exp(-1i*k0*R)./R;
    end

%   normal derivative of Green's function with respect to outer normal and
%   primed (xc,yc,zc) coordinates
    function out = Dngreen(x,y,z,xc,yc,zc,nx,ny,nz)
        Rx = x - xc;
        Ry = y - yc;
        Rz = z - zc;
        R = sqrt(Rx.^2 + Ry.^2 + Rz.^2);
        out = (1 + 1i*k0*R).*exp(-1i*k0*R) ./ R.^3 .*(nx.*Rx + ny.*Ry + nz.*Rz);
    end

end