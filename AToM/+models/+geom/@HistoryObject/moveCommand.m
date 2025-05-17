%% moveCommand move command in object history to new position
% The command at _oldPosition_ is moved to _newPosition_. The object is
% recomputed according to the new history.
%
%  INPUTS
%   obj: HistoryObject [1 x 1]
%   oldPosition: position of moved command, double [1 x 1]
%   newPosition: position of moved command, double [1 x 1]
%   geomObj: geometry object to be changed, GeomObject [1 x 1]
%
%  SYNTAX
%
%  obj.moveCommand(oldPosition, newPosition, geomObj)
%
% Order of commands of history object _obj_ chenges. The command at
% _oldPosition_ is moved to _newPosition_. The object is recomputed according to
% new history order at the end.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
