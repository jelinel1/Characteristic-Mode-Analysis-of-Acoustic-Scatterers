%% calculateS computes s parameter from z parameters
% Calculates S parameters.
%
%  INPUTS
%   zIn:       input impedance, double [N x N x M]
%               N - number of ports
%               M - number of frequencies
%
%  INPUTS
%  (parameters)
%   'z0'       characteristic impedance, double [1 x 1], default 50 Ohm
%
%  OUTPUTS
%   S:         s parameters, double [N x N x M]
%
%  SYNTAX
%
%  S = results.calculateS(zIn);
%  S = results.calculateS(zIn, 'z0', 50);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
