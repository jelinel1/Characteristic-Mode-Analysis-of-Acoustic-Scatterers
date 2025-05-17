%% Z2S converts z parameters to s parameters
% S = {inv(sqrt(Z0)) * Z * inv(sqrt(Z0)) - I} * ...
%     inv({inv(sqrt(Z0)) * Z * inv(sqrt(Z0)) + I})
%
%  INPUTS
%   Z:    matrix of z parameters, double [N x N x M]
%   Z0:   characteristic impedance or matrix of characteristic impedances,
%          double [1 x 1], default value: Z0 = 50 Ohm
%
%  OUTPUTS
%   S:    matrix of s parameters, double [N x N x M]
%
%  SYNTAX
%
%  S = Z2S(Z);
%  S = Z2S(Z, Z0);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
