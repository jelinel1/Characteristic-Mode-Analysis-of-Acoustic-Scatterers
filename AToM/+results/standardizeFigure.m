%% standardizeFigure standardize figure appearance
% Controls the appearance of figure and ensures the normalization of the
% figure.
% Default profile is saved in results.figureProfiles. Another profile
% can be created.
% Create your own profile, place it to .\+results\+figureProfiles folder
% and then call it by its name.
%
%  INPUTS
%   handles:          structure of graphical objects, struct [1 x 1]
%   userProfileName:  structure of graphical preferences, struct [ 1 x 1]
%                      or name of figureProfile, char [1 x N]
%
%  SYNTAX
%
%  standardizeFigure(handles)
%  standardizeFigure(handles, 'userProfileName')
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
