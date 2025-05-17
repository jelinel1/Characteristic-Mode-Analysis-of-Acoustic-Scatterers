%% removeSubGroupFromGroup remove GroupObjects from another GroupObject
% This method removes existing GroupObjects from superior GroupObject.
%
%  INPUTS
%   obj: Group object
%   subGroupNames: names of subordinate GroupObject, char [1 x N]
%   superiorGroupName: name of superior GroupObject, char [1 x N]
%
%  SYNTAX
%
%  obj.removeSubGroupFromGroup(subGroupNames, superiorGroupName)
%
% The objects of class GroupObject with names _subGroupNames_ are put in
% GroupObject with name _superiorGroupName_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
