%% plotEigennumber generates plot of given eigen numbers
% Creates plot of eigennumbers.
%
%  INPUTS
%  (parameters)
%   'eigennumber'             eigen numbers, double [N x M]
%                              N - number of modes
%                              M - number of frequencies
%   'characteristicAngle'     characteristic angles, double [N x M]
%                              N - number of modes
%                              M - number of frequencies
%   'frequency'               frequency list, double [M x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotEigennumbers('frequency', frequency, ...
%    'eigennumber', eigennumber);
%  handles = results.plotEigennumbers('frequency', frequency, ...
%    'characteristicAngle', characteristicAngle);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
