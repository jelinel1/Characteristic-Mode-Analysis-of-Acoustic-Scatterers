%% runButtCallbackOnce manage callback of uicontrol button execution.
% This methos enable to dissable button when its callback is executed to prevent
% multiple callback execution because of multiple click on button.
%
%  INPUTS
%   hButt: handle to buttin, uicontrol [1 x 1]
%   dissableString: string which apperar on button during callback execution.
%                   If leave empty (''), string on button is not changed.
%                   char [1 x N]
%   hFcn: anonymouf function to call, function_handle [1 x 1]
%
%  SYNTAX
%
%  mainViewer.runButtCallbackOnce(hButt, 'Calculationg', ...
%      solve(gui.followedProject.solvers.MoM1D));
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
