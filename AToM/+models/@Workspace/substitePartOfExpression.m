%% substitePartOfExpression substitute part of expression of variables.
% This method substitute part of variables' expression 'oldExpr' with 'newExpr'.
% Only instances of Workspace class can call this method.
%
%  INPUTS
%   logInd: logical indices of variables in workspace.list where editing of
%           expression is necessary, logical [n x 1]
%   oldExpr: part of expression which will be to substituted, char [1 x n]
%   newExpr: new part of expression, char [1 x n]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
