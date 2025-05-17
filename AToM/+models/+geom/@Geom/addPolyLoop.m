%% addPolyLoop include PolyLoop to Geom
% This method adds a new object PolyLoop to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   curveNames: names of individual curves to be added, char [1 x N]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addPolyLoop(curveNames)
%
% The object of type PolyLoop is created from curves specified by _curveNames_
% from Geom.
%
%  objName = obj.addPolyLoop(curveNames, name)
%
% The object of type PolyLoop is created from curves specified by _curveNames_
% from Geom. The name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
