%% subtractTwoObjects find result after subtraction between two GeomObjects
% This method finds rest of object after another object is subtracted.
%
%  INPUTS
%   obj: Boolean [1 x 1]
%   obj1: GeomObject1 [1 x 1]
%   obj2: GeomObject2 [1 x 1]
%
%  OUTPUTS
%   segSub: resulting subtraction Polygon segments, double [2*nSeg x 3]
%   parSub: parametric subtraction Polygon segments, double [2*nSeg x 1]
%   typeSub: segments type and curve pointer, [nSeg x 3]
%   isHoles: hole (1) or solid (0) segments, logical [nSegs x 1]
%
%  SYNTAX
%
%  [segSub, parSub, typeSub, isHoles] = obj.subtractTwoObjects(obj1, obj2)
%
% subtraction polygon defined by _segSub_, _parSub_, _typeSub_ and _isHoles_
% resulting after subtraction of two GeomObjects _obj1_ and _obj2_ is computed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
