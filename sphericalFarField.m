function FF = sphericalFarField(fVec, indexVec, indexMatrix, Z0, theta, phi)
%% sphericalFarField computes far-field base on f vector
% Computes far-field from spehrical waves based on fVec containing
% spherical expansion coefficients.
%
% INPUTS
%  fVec: weighting vector, double [M x 1]
%  indexVec: vector of ones and zeros containing information about use of specific
%            spherical wave, double [M x 1]
%  indexMatrix: matrix showing ordering of spherical waves, integer [3 x nSW]
%  theta: vector of points in theta spherical coordinate, double [1 x N]
%  phi: vector of points in phi spherical coordinate, double [1 x N]
%
% OUTPUTS
%  FF: structure with all computed quantities, struct [1 x 1]
%
% SYNTAX
%
%  FF = sphericalFarField(fVec, indexVec, indexMatrix, Z0, theta, phi)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz

%% prepare

% multiplication with constants
fVecWithConst = sqrt(Z0) * indexVec.* fVec .* (1i).^(indexMatrix(1, :).' + 1);


%% compute

nTh = length(theta);
nPh = length(phi);

[Mtheta, Mphi] = meshgrid(theta, phi);

xObs = reshape(cos(Mphi).*sin(Mtheta), [nTh*nPh,1]);
yObs = reshape(sin(Mphi).*sin(Mtheta), [nTh*nPh,1]);
zObs = reshape(cos(Mtheta), [nTh*nPh,1]);

% ordering of reshape
% Mat = reshape(reshape(Mat, [nTh*nPh,1]), [nPh,nTh]);

% matrix of all spherical harmonics at all points
Ymat = [];
sWindices = [];

for degreeL = 0:max(indexMatrix(1, :))
    sWindices = [sWindices, [ repmat(degreeL,[1,2*degreeL + 1]) ; (-degreeL):degreeL ]];
    Ymat = [Ymat, scalarSphericalHarmonic(degreeL, [xObs, yObs, zObs])];
end

if sum(sum(sWindices - indexMatrix(1:2,:))) ~=0
error('indexMatrix does not look as expected')
end

F = sum(repmat(fVecWithConst.',[nTh*nPh,1]).*Ymat,2);
F = reshape(F, [nPh,nTh]);

% scattered power
Pscatt = 0.5*(fVec')*fVec;

% directivity
D = 2 * pi * abs(F).^2 / Pscatt / Z0;

%% output
FF.theta = theta;
FF.phi = phi;
FF.F = F.';
FF.D = D.';
FF.Prad = Pscatt;
end