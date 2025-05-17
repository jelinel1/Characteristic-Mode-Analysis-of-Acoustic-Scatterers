%% addObjectToGroup include objects to GroupObject
% This method adds any object from Geom into GroupObject.
%
%  INPUTS
%   obj: Group object
%   groupName: name of GroupObject, char [1 x N]
%   objNames: names of objects to be added, separated by comma, char [1 x N]
%   type: GeomObjectType, [1 x N]
%
%  SYNTAX
%
%  obj.addObjectToGroup(groupName, objNames)
%
% The objects specified by objNames are found in Geom and Mesh containers and
% their Group is set to _groupName_.
%
%  obj.addObjectToGroup(groupName, objNames, type)
%
% If type of Geom is specified, the search is performed fatser.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
