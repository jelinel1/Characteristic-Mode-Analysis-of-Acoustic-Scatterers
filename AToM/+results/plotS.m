%% plotS generates plot of s parameters
% Creates plot of S parameters.
%
%  INPUTS
%  (parameters)
%   'zIn'         input impedance, double [N x N x M]
%                  N - number of ports
%                  M - number of frequencies
%   'z0'          characteristic impedance, double [1 x 1], default 50 Ohm
%   's'            s parameters, double [N x N x M]
%   'frequency'   list of frequencies, double [M x 1], [1 x M]
%   'select'      selection of visualised curves, double [P x 1]
%                  selection is based on MATLAB linear indexing
%   'scale'       select scale, char {'linear', 'dB'}, default: 'linear'
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotS('frequency', frequency, 'zIn', zIn, 'z0', 50);
%  handles = results.plotS('frequency', frequency, 's', S);
%  handles = results.plotS('frequency', frequency, 's', S, 'select', 1);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
