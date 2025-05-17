%% subtract perform boolean operation subtract on objects
% This perfoirms subtract Boolean operation on specified objects.
%
%  INPUTS
%   obj: Boolean object, [1 x 1]
%   names1: name of Object 1, char [1 x N]
%   names2: name of Object 2, char [1 x N]
%   type1: optional, type of Object 1, char [1 x N]
%   type2: optional, type of Object 2, char [1 x N]
%   callerName: optional, name of calling function, char [1 x N]
%
%  SYNTAX
%
%  obj.subtract(names1, names2)
%
% Objects specified by _names1_ and _names2_ are subtracted.
%
%  obj.subtract(names1, names2, type1, type2, callerName)
%
% Objects are searched faster according to hints in _type1_ and _type2_. Valid
% values of _callerName_ are: 'recomputeCommands' (do not write to History),
% 'user' (write to history).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
