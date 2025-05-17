function [Sp, Sdp, indexMatrix] = sMatrix(mesh, quadOrder, k0, Z0, lmax, verbosity, waitBar)
%% evaluates S-matrices
% This function evaluates S-matrix using numerical quadrature.
% f = -Sp*p - Sdp*dp
% where p is the boundary pressure and dp is normal derivative of surface
% pressure using outer normal.
%
% INPUTS
%  mesh: AToM stucture containing mesh
%  quadOrder: quadrature order, integer (1-12) [1 x 1]
%  k0: freespace wavenumber, double [1 x 1]
%  Z0: freespace impedance, double [1 x 1]
%  lmax: maximum order of spherical waves, integer [1 x 1]
%  verbosity: amount of information shown, integer (0,1,2,3) [1 x 1]
%  waitBar: AToM waitbar object
%
% OUTPUTS
%  Sp: matrix allowing evaluation of scattered pressure, double [nSW x Ntria]
%  Sdp: matrix allowing evaluation of scattered pressure, double [nSW x Ntria]
%  indexMatrix: matrix of spherical wave indices, double [3 x nSW]
%
% SYNTAX
%
% [Sp, Sdp, indexMatrix] = sMatrix(mesh, quadOrder, k0, Z0, lmax, verbosity, waitBar)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz

%% waitbar initialization

if ~exist('waitBar', 'var') || isempty(waitBar)
    if verbosity
        waitBar = models.utilities.graphics.Waitbar(0, ...
            'acoustic BEM: S-matrix', 0, [10 10 350 25], 0);
    else
        hFigure = figure('Visible', 'off');  % invisible windows for
        waitBar = models.utilities.graphics.Waitbar(hFigure, ... invisible waitbar
            'acoustic BEM: S-matrix', 0, [10 10 350 25], 0);
    end
else
    waitBar.update(0);
end

%% triangular parameters
TriaArea = mesh.triangleAreas;
p1 = mesh.nodes(mesh.connectivityList(:,1),:);
p2 = mesh.nodes(mesh.connectivityList(:,2),:);
p3 = mesh.nodes(mesh.connectivityList(:,3),:);

%% evaluate S-matrix
% Normal belongs to source side

% integration points and weights
[xq, yq, zq, weights, Nquadpoints, Ntria] = ...
    models.utilities.simplexIntegration.triaQuad(p1, p2, p3, quadOrder);
weights = 2*weights; % sum(weights) = 1

%% quadrature

deltaN = min(mesh.triangleEdgeLengths) / 1000;
normalShift = mesh.triangleNormals*deltaN; % differece along the normal

nxShift = normalShift(:,1);
nyShift = normalShift(:,2);
nzShift = normalShift(:,3);

kr = k0*sqrt(xq.^2 + yq.^2 + zq.^2);

krPlus = k0*sqrt((xq + repmat(nxShift,[1,Nquadpoints])).^2 + ...
    (yq + repmat(nyShift,[1,Nquadpoints])).^2 + ...
    (zq + repmat(nzShift,[1,Nquadpoints])).^2);

krMinus = k0*sqrt((xq - repmat(nxShift,[1,Nquadpoints])).^2 + ...
    (yq - repmat(nyShift,[1,Nquadpoints])).^2 + ...
    (zq - repmat(nzShift,[1,Nquadpoints])).^2);

% allocation
Sp  = [];
Sdp  = [];
indexMatrix = [];

count = 0;
for degreeL = 0:lmax

    jL = models.utilities.sphericalFunctions.sbesselj(degreeL,kr);
    jLPlus = models.utilities.sphericalFunctions.sbesselj(degreeL,krPlus);
    jLMinus = models.utilities.sphericalFunctions.sbesselj(degreeL,krMinus);

    % indexMatrix is ordered as follows: 1st row is L, 2nd row is M, 3rd row is absolute index
    indexMatrix = [indexMatrix, ...
        [repmat(degreeL,[1,2*degreeL + 1]) ; (-degreeL): degreeL ; count + (1:(2*degreeL + 1))  ]];
    count = count + (2*degreeL + 1);

    tmp = 0;
    tmpPlus = 0;
    tmpMinus = 0;
    for iq = 1:Nquadpoints
    
    waitBar.update((degreeL*Nquadpoints + iq) / (Nquadpoints*(lmax + 1)));

    tmp = tmp + repmat(jL(:,iq),[1,2*degreeL+1]).* ...
            scalarSphericalHarmonic(degreeL, [xq(:,iq), yq(:,iq), zq(:,iq)])*weights(iq,1);

    tmpPlus = tmpPlus + repmat(jLPlus(:,iq),[1,2*degreeL+1]).* ...
            scalarSphericalHarmonic(degreeL, ... 
            [xq(:,iq) + nxShift, yq(:,iq) + nyShift, zq(:,iq) + nzShift])*weights(iq,1);

    tmpMinus = tmpMinus + repmat(jLMinus(:,iq),[1,2*degreeL+1]).* ...
            scalarSphericalHarmonic(degreeL, ... 
            [xq(:,iq) - nxShift, yq(:,iq) - nyShift, zq(:,iq) - nzShift])*weights(iq,1);
    end

    dNtmp = (tmpPlus - tmpMinus)/(2*deltaN);

    Sdp = [Sdp; (tmp.*repmat(TriaArea,[1,2*degreeL+1])).'];
    Sp = [Sp; (dNtmp.*repmat(TriaArea,[1,2*degreeL+1])).'];
end

Sp = 1i/sqrt(Z0)*conj(Sp);
Sdp = -1i/sqrt(Z0)*conj(Sdp);

end