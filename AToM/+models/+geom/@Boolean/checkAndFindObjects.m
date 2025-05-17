%% checkAndFindObjects checks input names by user and finds objects in Geom
% This method validates inputs by user and searches for objects in Geom.
%
%  INPUTS
%   obj: Boolean object, [1 x 1]
%   names1: name of Object 1, char [1 x N]
%   names2: name of Object 2, char [1 x N]
%   type1: optional, type of Object 1, char [1 x N]
%   type2: optional, type of Object 2, char [1 x N]
%
%  OUTPUTS
%   foundObj1: names1 objects references, GeomObject [1 x N]
%   foundObj2: names2 objects references, GeomObject [1 x N]
%
%  SYNTAX
%
%  obj.checkAndFindObjects(names1, names2)
%
% Objects specified by _names1_ and _names2_ are subtracted.
%
%  obj.checkAndFindObjects(names1, names2, type1, type2)
%
% Objects are searched faster according to hints in _type1_ and _type2_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
