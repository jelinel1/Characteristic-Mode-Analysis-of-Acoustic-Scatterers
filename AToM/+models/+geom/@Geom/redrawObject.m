%% redrawObject change number of drawPoints for GeomObjects
% Number of drawPoints of GeomObjects is changed by user.
%
%  INPUTS
%   obj: Geom object [1 x 1]
%   name: names of objects to be modified, char [1 x N]
%   nPoints: number of points to be used for visualization, double [1 x N]
%   type: optional, types of Geom Object, char [1 x N]
%
%  SYNTAX
%
%  obj.redrawObject(names, nPoints)
%
% The objects of Geom (_obj_) specified in _namse_ are changed. Number of
% drawPoints is set according to _nPoints_.
%
%  obj.redrawObject(names, nPoints, types)
%
% If _types_ is specified, the search within Geom is performed faster.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
