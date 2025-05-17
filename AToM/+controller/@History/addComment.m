%% addComment is able to add the comment to the the history list
% Public method which is able to add comment to the commandHistory property.
% Using comment as vector of chars or cell array of strings is possible.
%
%  INPUTS
%   stringToHistory: User's comment to history, Char [1 x N]
%                    comments in cell array of strings, Cell [1 x N]
%   row: location of added comment, double [1 x 1]
%
%  SYNTAX
%
%  addComment(comment)
%
% Input "comment" can by string or cell array of strings which will be separeted
% on the rows. Comments will be paste on the end of history list
%
%  addComment(comment, row)
%
% Input "comment" can by string or cell array of strings which will be separeted
% on the rows. In this case input "row" defines location of comment.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
