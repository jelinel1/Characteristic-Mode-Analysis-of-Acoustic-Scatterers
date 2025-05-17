%% init initializes of Antenna Toolbox for Matlab
% This method is able to launch instance of AToM. It is possible to call this
% method using two inputs parameters. First parameter is 'checkGUIopening'
% (logical) and second is 'preferedFile' (string). AToM is singleton.
%
%  INPUTS
%   checkGUIopening: false launches AToM without GUI, logical [1 x 1]
%                    true launches AToM with GUI, logical [1 x 1]
%   preferedFile: full file name to file with preferences, string [1 x N]
%
%  OUTPUTS
%   atomReference = reference to AToM instance, Atom class
%
%  SYNTAX
%
%  atomReference = Atom.initialize
%
% Calling of 'initialize' method without parameter launches AToM instance with
% graphic user interface.
%
%  atomReference = Atom.initialize(checkGUIopening)
%
% Two option of 'checkGUIopening' parameter for launching AToM with (true) or
% without (false) graphic user interface.
%
%  atomReference = Atom.initialize(checkGUIopening, preferedFile)
%
% The 'checkGUIopening' parameter ensures the AToM opening with/without GUI and
% the 'preferedFile' is able to launch the AToM with user's prefered preferences
% file.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
