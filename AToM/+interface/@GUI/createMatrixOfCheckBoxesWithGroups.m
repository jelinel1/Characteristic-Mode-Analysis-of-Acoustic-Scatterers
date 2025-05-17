%% createMatrixOfCheckBoxesWithGroups create matrices of checkboxes and sort
% them into individual groups.
% Only instance of Viewer and GUI can call this method.
%
%  INPUTS
%   allStrings: cell with checkboxes strings, cell [N x 1]
%   allTooltips: cell with checkboxes tooltip strings, cell [N x 1]
%   groups: vector with group numbers of all strings, double [N x 1]
%   groupNames: names of groups, cell [nGroups x 1]
%   nColumns: number of columns with checkboxes, double [1 x 1]
%   hParentPanel: handle to parent object of checkboxes
%   LLC: coordinates in pixels of low left corner of low left checkbox,
%        double [1 x 2]
%   matrixWidth: width of matrix of checkboxes, double [1 x 1]
%   rowHeight: heigth of every row of checkboxes, double [1 x 1]
%
%  OUTPUTS
%   allRadioButtons: matrix of uicontrols, uicontrol [N x 1]
%   overallHeight: height of matrices of checkboxes and group names, double [1 x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
