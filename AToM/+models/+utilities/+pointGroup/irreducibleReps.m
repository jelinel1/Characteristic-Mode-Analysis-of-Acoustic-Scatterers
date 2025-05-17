%% irreducibleReps compute irreducible representations
% Compute irreducible representation
%
%  INPUTS
%   eigVec: eigen vectors, double [nUnknowns x nModes x nFreq]
%   C: mapping matrices C, cell [nSymmetries x 1]
%   tol: tolerance of zero, double [1 x 1]
%
%  OUTPUTS
%   modesIrrep: classification of modesi nto irreps, double [nModes x nFreq]
%   irrepChars: characters of irreps, double [nIrreps x nSymmetries]
%   Di: matrix representation of irreps, cell [nIrreps x nSymmetries]
%
%  REFERENCE
%  [1] R. McWeeny, Symmetry. Mineola: Dover Publications, 2005.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
