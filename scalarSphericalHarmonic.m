function [Y] = scalarSphericalHarmonic(degreeL, rObs)
%% evaluates scalar spherical harmonic
% This function evaluates scalar spherical harmonic, defined according to
% Jakson, classical electrodynamics, Sec. 3.5
% For given l, the output contains all m = -l .. l.
%
% INPUTS
%  degreeL: degree l, integer [1 x 1]
%  rObs: observation point, double [nObs x 3]

% OUTPUTS
%  Y: spherical harmonic, double [nObs x (2*degreeL + 1)]
%
% SYNTAX
%
% [Y] = scalarSphericalHarmonic(rObs)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz


nObs = size(rObs,1);
x = rObs(:,1);
y = rObs(:,2);
z = rObs(:,3);
rho = sqrt(x.^2 + y.^2);
% r = sqrt(rho.^2 + z.^2);
phi = angle(x + 1i*y);
theta = angle(z + 1i*rho);

phi = repmat(phi,[1,degreeL + 1]);
m = repmat(0:degreeL,[nObs,1]);

% Y for m = 0 .. l, m runs along a row
Y = sqrt((2*degreeL + 1)/(4*pi)*factorial(degreeL - m)./factorial(degreeL + m)).* ...
    (legendre(degreeL,cos(theta)).').* ...
    exp(1i*m.*phi);

% Jackson (3.54)
tmp = ((-1).^m).*conj(Y);
tmp = tmp(:,2:(degreeL + 1));
Y = [flip(tmp,2),Y];

end