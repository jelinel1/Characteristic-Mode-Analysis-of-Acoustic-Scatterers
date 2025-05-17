%% recomputeCommands recomputes whole history of object's commands
% All command in geometry object's history are recomputed from the objects
% initial definition according to actual values in workspace.
%
%  INPUTS
%   obj: HistoryObject [1 x 1]
%   callerName: optional, name of calling function, char [1 x 1]
%
%  SYNTAX
%
%  obj.recomputeCommands()
%
% History of object _obj_ is recomputed. As a start poin, the initial definition
% of object _obj_ is taken. The initial position is defined by actual values in
% workspace
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
