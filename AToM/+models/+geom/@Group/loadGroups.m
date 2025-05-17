%% loadGroups load all GroupObjects from format stored in HDF
% This method creates all GroupObjects saved in .
%
%  INPUTS
%   obj: Group object
%   groupTable: names of GroupObjects, cell [N x M]
%
%  SYNTAX
%
%  obj.loadGroups(groupTable)
%
% The objects of class GroupObject are created in Group. Names of GroupObjects
% are loaded from HDF dataset stored in _groupTable_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
