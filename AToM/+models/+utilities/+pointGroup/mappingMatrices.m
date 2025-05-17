%% mappingMatrices create mapping matrices
% Create mapping matrices of presented symmetries on given structure
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   symmetryOperations: list of symmetry operations, cell [nSymmetries x 1]
%      (see more in models.utilities.pointGroup.transformationMatrices)
%  basisFcns: basis functions, struct [1 x 1]
%
%  OUTPUTS
%   C: mapping matrices, cell [nSymmetriesPresented x 1]
%   symmetryOperations: list of presented symmetry operations,
%       cell [nSymmetriesPresented x 1]
%   hasSymmetry: has structure input symmetries, logical [nSymmetries x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
