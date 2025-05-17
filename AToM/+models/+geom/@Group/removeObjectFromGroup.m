%% removeObjectFromGroup remove Geom objects from GroupObject
% This method removes any object from Geom from GroupObject.
%
%  INPUTS
%   obj: Group object
%   groupName: name of GroupObject, char [1 x N]
%   objNames: names of objects to be added, separated by comma, char [1 x N]
%   type: GeomObjectType, [1 x N]
%
%  SYNTAX
%
%  obj.removeObjectFromGroup(groupName, objNames)
%
% The objects specified by _objNames_ are found in Geom container and
% deleted from GroupObject _groupName_. Their group attributes remain not set.
%
%  obj.removeObjectFromGroup(groupName, objNames, type)
%
% If type of Geom is specified, the search is performed fatser.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
