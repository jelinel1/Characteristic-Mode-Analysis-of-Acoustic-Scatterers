%% S2Z converts s parameters to z parameters
% Z = sqrt(Z0)* (I + S) * inv(I - S) * sqrt(Z0)
%
%  INPUTS
%   S:    matrix of s parameters, double [N x N x M]
%   Z0:   characteristic impedance,
%          double [1 x 1], default value: Z0 = 50 Ohm
%
%  OUTPUTS
%   Z:    matrix of z parameters, double [N x N x M]
%
%  SYNTAX
%
%  Z = S2Z(S);
%  Z = S2Z(S, Z0);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
