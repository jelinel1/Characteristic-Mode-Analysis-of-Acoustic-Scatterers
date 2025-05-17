%% lmax gives estimate of highest L order for spherical expansion
%
%  INPUTS
%   k0List: (a vector of) normalized electrical size(s)
%   nodes:  points, double [N x 3], e.g. nodes = Mesh.nodes
%
%  OUTPUTS
%   Lmax: highest degree of Legendre polynomial to be used
%
%  SYNTAX
%
%  Lmax = lmax(k0List, nodes)
%
% See
% [1] Tayli, Capek, Akrou, Losenicky, Jelinek, Gustafsson: Accurate and
%     Efficient Evaluation of Characteristic Modes, IEEE TAP, 2018.
%     https://arxiv.org/pdf/1709.09976.pdf
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018-2020, Miloslav Capek, CTU in Prague, miloslav.capek@fel.cvut.cz
% mcode docu
