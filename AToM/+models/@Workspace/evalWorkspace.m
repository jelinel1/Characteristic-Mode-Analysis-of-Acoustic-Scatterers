%% evalWorkspace updates values of all public variables after some change.
% Is called after adding, editing and deleting some variable from list.
% Only instances of Workspace class can call this method.
%
%  INPUTS
%   variablesToSolve: column vector of instances of Variable class. These
%                     variables will be evaluated. Variable [n x 1]
%   variablesForNotification: column vector of variables of which will be called
%                             method notifySubscribers
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
