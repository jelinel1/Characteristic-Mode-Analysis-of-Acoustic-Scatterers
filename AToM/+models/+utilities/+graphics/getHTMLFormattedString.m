%% getHTMLFormattedString return html compattible string.
% It is possible to define Foreground and Background color. All inouts are
% mandatory. For unwanted form pass empty [] color or empty char ''.
%
%  INPUTS
%   inputString: string to show, char [1 x N]
%   foregroundColor: color of string in [R G B] form, values 0-1, double [1 x 3]
%   backgroundColor: color of background in [R G B] form, values 0-1, double [1 x 3]
%   typeface: typeface type, 'b' for bold, 'i' for italic, etc., char [1 x 1]
%
%
%  OUTPUTS
%   htmlString: formatted html string, char [1 x N]
%
%  SYNTAX
%
%  htmlCommand = models.utilities.graphics.getHTMLFormattedString('My String', [0 0 0], [1 1 1], 'b')
%  htmlCommand = models.utilities.graphics.getHTMLFormattedString('My String', [0 0 0], [], '')
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode
