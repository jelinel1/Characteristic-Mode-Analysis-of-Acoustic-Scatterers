%% shiftAndScale Shifts and scales objects according to specified values
%
% INPUTS
%  data: data matrix,  double [N x M]
%        _CMap:    M = 13
%        _Quiver:  M = 7
%  xDataPositions: specifies position of X coordinates in data matrix,
%                  double [N x 1]
%  shift: sets the shift of the object, double [3 x 1]
%  scale: sets the enlargement of the object, double [1 x 1]
%
% OUTPUTS
%  data: data containing the sift and scale, double [N x M]
%
% SYNTAX
%  data = results.export.shiftAndScale(data, [2 5], [1 1 1], 1)
%
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
