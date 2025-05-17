%% calculateQFBW computes Q_FBW
% Calculates quality factor Q_FBW.
%
%  INPUTS
%   zIn:       input impedance, double [N x 1]
%               N - number of frequencies
%   frequency: frequency list, double [N x 1], [1 x N]
%   alpha:     FBW threshold, double [1 x 1]
%
%  OUTPUTS
%   QFBW:      quality factor QFBW, double [M x 1]
%   f          frequencies corresponding to QFBW, double [M x 1]
%
%  SYNTAX
%
%  [QFBW, f] = results.calculateQFBW(zIn, frequency, alpha)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
