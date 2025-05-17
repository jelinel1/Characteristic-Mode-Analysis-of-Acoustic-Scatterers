%% createMatrixOfCheckboxes creates matrix of checkboxes to gui.
% Only instance of Viewer and GUI can call this method.
%
%  INPUTS
%   allStrings: cell with checkboxes strings, cell [N x 1]
%   allTooltips: cell with checkboxes tooltip strings, cell [N x 1]
%   nColumns: number of columns with checkboxes, double [1 x 1]
%   hParentPanel: handle to parent object of checkboxes
%   LLC: coordinates in pixels of low left corner of low left checkbox,
%        double [1 x 2]
%   matrixWidth: width of matrix of checkboxes, double [1 x 1]
%   rowHeight: heigth of every row of checkboxes, double [1 x 1]
%
%  OUTPUTS
%   radiobuttonsMatrix: matrix of uicontrols, uicontrol [N x 1]
%   matrixHeight: height of matrix of checkboxes, double [1 x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
