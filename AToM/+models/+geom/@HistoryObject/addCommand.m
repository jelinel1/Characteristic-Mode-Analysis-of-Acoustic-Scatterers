%% addCommand add command to object history
% The command _cmd_ and necessary varables _var_ are saved to object history for
% future recomputation.
%
%  INPUTS
%   obj: HistoryObject [1 x 1]
%   cmd: name of command, char [1 x N]
%   var: reference to variables from Workspace, var [1 x N]
%   position: position where new command will be added, double [1 x 1]
%
%  SYNTAX
%
%  obj.addCommand(cmd, var)
%
% History object _obj_ saves performed command _cmd_ and references to its
% necessary variables _var_. The command is aded to end.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
