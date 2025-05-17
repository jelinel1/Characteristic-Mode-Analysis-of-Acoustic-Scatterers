%% intersectTwoObjects find intersection between two GeomObjects
% This method finds intersection part between two GeomObjects.
%
%  INPUTS
%   obj1: GeomObject1 [1 x 1]
%   obj2: GeomObject2 [1 x 1]
%
%  OUTPUTS
%   segInter: resulting intersection Polygon segments, double [2*nSeg x 3]
%   parInter: parametric intersection Polygon segments, double [2*nSeg x 1]
%   typeInter: segments type and curve pointer, [nSeg x 3]
%   isHoles: hole (1) or solid (0) segments, logical [nSegs x 1]
%
%  SYNTAX
%
%  [segInter, parInter, typeInter, isHoles] =  ...
% models.geom.Boolean.intersectTwoObjects(obj1, obj2)
%
% Intersection polygon between two GeomObjects _obj1_ and _obj2_ are computed.
% The objects are not modified.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
