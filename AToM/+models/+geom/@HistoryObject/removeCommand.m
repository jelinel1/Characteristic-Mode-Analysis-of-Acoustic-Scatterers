%% removeCommand removes command from object's history
% The command identified by _id_ and its necessary varables are deleted from
% object's history list and workspace, respectively.
%
%  INPUTS
%   obj: HistoryObject [1 x 1]
%   id: command #, double [1 x 1]
%   callerName: optional, name of calling function, char [1 x N]
%
%  SYNTAX
%
%  obj.removeCommand(id)
%
% The command identified by _id_ is deleted from history object _obj_ of
% geometry object (Point, Line, EllipseArc ...). Also variables necessary for
% history recomputation are deleted from Workspace. The object is updated at the
% end.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
