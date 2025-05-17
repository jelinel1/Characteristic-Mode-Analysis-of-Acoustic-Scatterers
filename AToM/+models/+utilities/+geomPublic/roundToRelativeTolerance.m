%% roundToRelativeTolerance round to relative tolerance
% This function round values to relative tolerance according to their
% max abs value.
%
%  INPUTS
%   values: set of values, double [nVals1 x nVals2]
%   tol: geom relative precision, double [1 x 1]
%
%  OUTPUTS
%   uniquePoints: set of unique points, double [nUniques x 1/2/3]
%
%  SYNTAX
%
%  values = models.utilities.geomPublic.roundToRelativeTolerance(values, tol)
%
% Function roundToRelativeTolerance throws back values __values
% rounded to a relative tolerance _tol_ accrodnig to their max abs value.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
