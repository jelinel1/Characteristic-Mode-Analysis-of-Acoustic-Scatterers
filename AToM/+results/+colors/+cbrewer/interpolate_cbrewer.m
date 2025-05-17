%
% INTERPOLATE_CBREWER - interpolate a colorbrewer map to ncolors levels
%
% INPUT:
%   - cbrew_init: the initial colormap with format N*3
%   - interp_method: interpolation method, which can be the following:
%               'nearest' - nearest neighbor interpolation
%               'linear'  - bilinear interpolation
%               'spline'  - spline interpolation
%               'cubic'   - bicubic interpolation as long as the data is
%                           uniformly spaced, otherwise the same as 'spline'
%   - ncolors=desired number of colors
%
% Author: Charles Robert
% email: tannoudji@hotmail.com
% Date: 14.10.2011
