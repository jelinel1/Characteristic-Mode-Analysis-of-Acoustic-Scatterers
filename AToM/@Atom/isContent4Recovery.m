%% isContent4Recovery decides if current item will be recovered
% This method wants interaction with user, who decides if current item from
% recovery.log file will be recovered.
%
%  INPUTS
%   item4recovery: full file name of failed project, string [1 x N]
%
%  OUTPUTS
%   isWanted2Recovery: decision, logical [1 x 1]
%
%  SYNTAX
%
%  isWanted2Recovery = isContent4Recovery(item4recovery)
%
% item4recovery is full file name to failed project. Depending on whether user
% decides yes or no isWanted2Recovery sets as logicol true or false.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
