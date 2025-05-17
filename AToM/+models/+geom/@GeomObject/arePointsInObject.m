%% arePointsInObject determine if points lie inside of an object
% This method determines if 3D points lie inside or outside of specified object.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   points: 3D points, double [nP x 3]
%   parts: optional, part # that should be checked, double [n x 1]
%
%  OUTPUTS
%   areIn: are points inside object, logical [nP x 1]
%   partNums: part # where both IN, cell [1 x nLines], double [nParts x 1]
%
%  SYNTAX
%
%  areIn = obj.arePointsInObject(points)
%
% Method arePointsInObject determines if 3D _points_ lie inside GeomObject
% _obj_ or not.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
