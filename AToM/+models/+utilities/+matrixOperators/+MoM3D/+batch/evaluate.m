%% evaluate gathers all matrix operators required by the user
%  This function generates basis functions and evaluate all matrices, for
%  the complete list see batch.getList
%
%  INPUTS
%   Mesh:   mesh structure, struct [1 x 1]
%   fList:  frequency list, double [1 x F]
%   ZsList: list of surface impedances [1 x F]
%   varargin implemented in property-value pairs, the properties are:
%    'requests', see getList(), default: {'Z', 'omW', 'Rmat'}
%    'quadOrder', {1, (2), ..., 12}
%    'symmetrize', {true | (false)}, true: all square operators symmetrized
%    'verbosity', {0, 1, (2)}
%    'usegpu', {true | (false)}, true: MoM evaluted on GPU (if possible)
%    'lmax',    {integer}, order of L index for evaluation of S matrices
%
%  OUTPUTS
%   OP: structure with all operators precalculated, struct [1 x 1]
%   tt: total computational time in seconds [1 x 1]
%
%  SYNTAX
%
%  [OP, tt] = models.utilities.matrixOperators.MoM3D.batch.evaluate(..
%             Mesh, fList, epsrList, varargin)
%
%   Notes:
%   1/ For controllable regions, see package in
%      models.utilities.subregionMatrices....
%   2/ fList and epsrList can be either 1x1 or 1xF
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
