%% addEquatoionCurve include EquatoionCurve to Geom
% This method adds a new object EquatoionCurve to object container of class
% Geom. It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   eqX: handle function to X coordinate, char [1 x N]
%   eqY: handle function to Y coordinate, char [1 x N]
%   eqZ: handle function to Z coordinate, char [1 x N]
%   parInt: interval for parameter, char [1 x N]/double [1 x 2]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%  objName = obj.addEquatoionCurve(eqX, eqY, eqZ, parInt)
%
% The object of type EquatoionCurve specified by handle functions _eqX_, _eqY_,
% _eqZ and parameter interval _parInt_ is created in Geom.
%
%  objName = obj.addLine(points, name)
%
% The object of type EquatoionCurve specified by handle functions _eqX_, _eqY_,
% _eqZ and parameter interval _parInt_ is created in Geom. The name of new
% object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
