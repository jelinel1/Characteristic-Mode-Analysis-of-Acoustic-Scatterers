%% createKernel computes block dimensions from maximum threads per block
%
%  INPUTS
%   maxBlockSize: maximum threads per block from gpuDevice().MaxThreadsPerBlock, double [1 x 1]
%
%  OUTPUTS
%   blockSize: vector with sizes in each dimension, double [1 x 3]
%
%  SYNTAX
%   blockSize = computeBlockSize(maxBlockSize)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode
