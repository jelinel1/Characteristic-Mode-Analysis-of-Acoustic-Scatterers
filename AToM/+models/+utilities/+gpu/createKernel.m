%% createKernel creates GPU kernel object
%  An entry point is selected based on a file name and selected computation
%  precisiton
%
%  INPUTS
%   name: file name, char [1 x N]
%   filePath: path to cu file and folder with ptx files, char [1 x N]
%   precision: single or double, char [1 x N]
%
%  OUTPUTS
%   kernel: MATLAB GPU kernel object
%
%  SYNTAX
%   kernel = createKernel(name, filePath, precision)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode
