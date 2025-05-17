%% maxMatrixSizeOnGPU computes dimension of a matrix which can be stored on a GPU
%
%  INPUTS
%   computedDimX: number of elements in the computed matrix in x dimension, double [1 x 1]
%   computedDimY: number of elements in the computed matrix in y dimension, double [1 x 1]
%   count: number of simultanously computed matrices, double [1 x 1]
%   supportMatrix: number of elements in the supporting matrices, double [1 x 1]
%   precision: single or double, char [1 x N]
%
%  OUTPUTS
%   dimX: x dimension of the matrix stored on the GPU, double [1 x 1]
%   dimY: y dimension of the matrix stored on the GPU, double [1 x 1]
%
%  SYNTAX
%   [dimX, dimY] = maxMatrixSizeOnGPU(computedMatrix, supportMatrix, precision)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode
