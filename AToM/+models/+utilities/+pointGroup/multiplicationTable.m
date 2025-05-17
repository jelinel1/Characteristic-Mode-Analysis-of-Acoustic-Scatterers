%% multiplicationTable compute multiplication table and symmetry classes
% Compute multiplicaiton table and symmetry classes
%
%  INPUTS
%   CorR: mapping matrices C, cell [nSymmetries x 1] or
%         transformation matrices T, double [3 x 3 x nSymmetries]
%   dispResults: display results, logical [1 x 1]
%
%  OUTPUTS
%   multiTab: multiplication table, double [nymmetries x nSymmetries]
%   classList: list of classes, cell [1 x nClasses]
%   classTab: table of classes elements, double [nSymmetries x nSymmetries]
%   hndl: handle to elements of figure with m. table, struct [1 x 1]
%
%  REFERENCE
%  [1] R. McWeeny, Symmetry. Mineola: Dover Publications, 2005.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Miloslav Capek, CTU in Prague, mmiloslav.capek@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
