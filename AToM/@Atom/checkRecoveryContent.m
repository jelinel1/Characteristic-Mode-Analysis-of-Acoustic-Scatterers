%% checkRecoveryContent returns content of recovery.log file
% Using this method is possible to find out if last projects was clearly closed.
% Method returns full file name of failed projects after last AToM instance.
%
%  OUTPUTS
%   recoveryContent: array of failed projects, cell [1 x N]
%
%  SYNTAX
%
%  recoveryContent = checkRecoveryContent
%
% recoveryContent is content of recovery.log file returned by
% checkRecoveryContent method.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
