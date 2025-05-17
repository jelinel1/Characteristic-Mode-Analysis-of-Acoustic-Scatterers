%% uniteTwoObjects find result after unite between two GeomObjects
% This method finds nonoverlapping parts of both objects and unites them
% into first object.
%
%  INPUTS
%   obj: Boolean [1 x 1]
%   obj1: GeomObject1 [1 x 1]
%   obj2: GeomObject2 [1 x 1]
%
%  OUTPUTS
%   segUni: resulting union Polygon segments, double [2*nSeg x 3]
%   parUni: parametric union Polygon segments, double [2*nSeg x 1]
%   typeUni: segments type and curve pointer, [nSeg x 3]
%   isHoles: hole (1) or solid (0) segments, logical [nSegs x 1]
%
%  SYNTAX
%
%  [segUni, parUni, typeUni, isHoles] = obj.uniteTwoObjects(obj1, obj2)
%
% United polygon defined by _segUni_, _parUni_, _typeUni_ and _isHoles_
% resulting after union of two GeomObjects _obj1_ and _obj2_ is computed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
