%% Generate bowtie
% This method creates a bowtie antenna points.
%
%  INPUTS
%   L: length of the bounding box, double [1 x 1]
%   W: width of the bounding box, double [1 x 1]
%   w: width of the feeder (placed in the middle), double [1 x 1]
%   H: length of the rectangular part (aligned with L, placed at the ends of b.)
%   N: number of points used for curved section (one Bezier segment), d. [1 x 1]
%   dA, eA: X, Y coordinates for anchor related to the (0,0) point, d. [1 x 1]
%   dB, eB: X, Y coordinates for anchor related to the (1,1) point, d. [1 x 1]
%
%  OUTPUTS
%   Bowtie: curve points, char [N x 2]
%
%  SYNTAX
%
%  Bowtie = generateBowtie(L, W, w, H, N, dA, eA, dB, eB)
%
% The bowtie antenna points generated.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
