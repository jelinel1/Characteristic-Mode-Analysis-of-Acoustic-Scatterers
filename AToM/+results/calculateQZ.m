%% calculateQZ computes Q_Z
% Calculates quality factor Q_Z.
%
%  INPUTS
%   zIn:       input impedance, double [N x 1]
%               N - number of frequencies
%   frequency: frequency list, double [N x 1], [1 x N]
%
%  OUTPUTS
%   QZ:      quality factor QZ, double [M x 1]
%   QZTuned: quality factor QZ tuned to resonance, double [M x 1]
%
%  SYNTAX
%
%  [QZ, QZTuned] = results.calculateQZ(zIn, frequency)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
