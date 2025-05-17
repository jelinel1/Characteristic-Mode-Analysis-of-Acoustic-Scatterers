%% functionY vector spherical harmonics Y
%
%  INPUTS
%   degreeL: vector of degrees L, double [N x 1]
%   orderM:  vector of orderes M, double [N x 1]
%   theta:   vector of theta coordinates, double [M x 1]
%   phi:     vector of phi coordinates, double [M x 1]
%
%  OUTPUTS
%   Y1:   Y1 vector spherical hamonic, complex double [N x M x 3]
%   Y2:   Y2 vector spherical hamonic, complex double [N x M x 3]
%   Y3    Y3 vector spherical hamonic, complex double [N x M x 3]
%
%  SYNTAX
%   [Y1, Y2, Y3] = functionY(degreeL, orderM, theta, phi)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
