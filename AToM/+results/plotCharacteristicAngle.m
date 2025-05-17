%% plotCharacteristicAngle generates plot of given characteristic angle
% Creates plot of characteristic angle.
%
%  INPUTS
%  (parameters)
%   'characteristicAngle'     characteristic angles, double [N x M]
%                              N - number of modes
%                              M - number of frequencies
%   'eigennumber'             eigen numbers, double [N x M]
%                              N - number of modes
%                              M - number of frequencies
%   'frequency'               frequency list, double [M x 1]
%   'handles'                 handles to the modification, struct [1 x 1]
%   'template'                template containing graphic rules,
%                              struct [1 x 1]
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotCharacteristicAngle('frequency', frequency, ...
%    'characteristicAngle', characteristicAngle);
%  handles = results.plotCharacteristicAngle('frequency', frequency, ...
%    'eigennumber', eigennumber);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
