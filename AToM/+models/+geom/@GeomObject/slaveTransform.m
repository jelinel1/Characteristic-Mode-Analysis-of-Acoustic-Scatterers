%% slaveTransform perform transformation on slave objects
% This method checks for unique slave objects and performs same transformation
% as master object does.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   transformName: transform identifier, char [1 x N]
%   param1: first parameter of trasformation, double [1 x 1] / [1 x 3]
%   param2: second parameter of trasformation, double [1 x 3]
%
%  SYNTAX
%
%  obj.slaveTransform(transformName, param1, param2)
%
% Method slaveTransform checks all slave objects of _obj_ and performs the
% same operation (specified by _transformName_) on them as using transform
% parameters _param1_ (and if necessary _param2_).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
