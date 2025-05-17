%% createGroup include object to Group object container
% This method adds any new GroupObject to object container of class Group.
%
%  INPUTS
%   obj: Group object
%   name: name of new GroupObject, char [1 x N]
%   superiorGroupName: name of superior GroupObject, char [1 x N]
%
%  SYNTAX
%
%  obj.createGroup()
%
% The object of class GroupObject with default name is created.
%
%  obj.createGroup(name)
%
% The GroupObject with _name_ is created.
%
%  obj.createGroup(name, superiorGroupName)
%
% The GroupObject with _name_ is created. It is subGroup of GroupObject
% _superiorGroupName_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
