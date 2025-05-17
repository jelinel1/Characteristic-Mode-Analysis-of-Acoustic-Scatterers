%% uniquetol Unique values with tolerance and outputs are in the original order
%  This function is fallback for versions of Matlab (<2015a) which don't have
%  built-in uniquetol.
%
%  INPUTS
%   toUnique: elements to unique, double [N x X]
%   epsilon: tolerance, double [1 x 1]
%   param1: ByRows parameter, char [1 x N]
%   val1: value of parameter 1, logical [1 x 1]
%
%  OUTPUTS
%   res: unique elements from toUnique, double [N x X]
%   ia: res = toUnique(ia,:), double [N x 1]
%   ic: toUnique = res(ic,:), double [N x 1]
%
%  SYNTAX
%
%  [res, ia, ic] = models.utilities.meshPublic.uniquetolSorted(toUnique,
%  epsilon, param1, val1);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
