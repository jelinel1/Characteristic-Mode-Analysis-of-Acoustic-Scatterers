%% getPositionOfComponentsInGrid return positions of gui comp. arranged in grid.
% All dimensinons are in pixels. Individual rows of utput matrix are suitable
% for Position property of gui components arranged in grid. Sequence of
% components is like in linear indexing.
%
%  INPUTS
%   LLC: low left corner coordinates in px, double [1 x 2]
%   rowsHeight: height of individual rows, first number is height of upper row,
%               double [1 x nRows]
%   columnsWidth: width of individual columns, double [1 x nColumns]
%   gapX, gapY: gaps between inidividual cells in grid in X any Y directions,
%               double [1 x 1]
%
%  OUTPUTS
%   gridPositions: matrix with positions of all components,
%                  double [nRwos*nColumns x 4]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode
