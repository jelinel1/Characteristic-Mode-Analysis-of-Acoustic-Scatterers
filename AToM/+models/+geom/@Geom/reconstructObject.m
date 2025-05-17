%% reconstructObject reconstruct object from Geom
% This method reinitiates an object specified by its _name_ saved in Geom.
% The definig properties of the object are set to initiate expresssion value or
% to new values.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   name: object name, char [1 x N]
%   varargin:
%            type: optional, type of object, char [1 x N]
%            property-value pairs, with new values for defining prop. [1 x 2N]
%
%  OUTPUTS
%   isModified: logical [1 x 1]
%
%  SYNTAX
%
%  isModified = obj.reconstructObject(name)
%
% The object specified by _name_ is reconstructed (if found in Geom object
% _obj_). The objects defining properties are reconstructed to initial
% expression.
%
%  isModified = obj.reconstructObject(name, type)
%
% The object specified by _name_ is reconstructed (if found in Geom object
% _obj_). If _type_ of object is set, the search is performed faster just within
% objects of specified type. Possible types are objects of class GeomObjectType:
% 'Point', 'Line', 'EllipseArc', 'EquationCurve', 'ParallelogramFrame',
% 'PolyCurve', 'Parallelogram', 'Ellipse', 'PolyLoop', 'Curve', 'Shape'.
% The objects defining properties are reconstructed to initial expression.
%
%  isModified = obj.reconstructObject(name, type, varargin)
%
% The objects defining properties are to values defined by 'property'-'value'
% pairs in _varargin_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
