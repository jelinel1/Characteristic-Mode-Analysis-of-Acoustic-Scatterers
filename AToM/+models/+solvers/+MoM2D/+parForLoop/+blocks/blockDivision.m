%% blockDivision determines indices of blocks of data to be solved in parfor
% We assume symmetric matrix of size _matSize_ to be solved using parfor.
% Each worker is capable of computing amount of data of size _nBatchMax_.
% Since the matrix is symmetric, only upper triangular part of is to be solved.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
