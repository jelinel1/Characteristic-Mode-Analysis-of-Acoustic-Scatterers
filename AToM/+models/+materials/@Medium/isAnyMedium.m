%% isAnyMedium returns information about expected medium.
% This method returns if expected medium name exist. When medium already exists,
% then can returns medium type and his order in library.
%
%  INPUTS
%   mediumName: Name of excpected medium, Char [1 x N]
%
%  OUTPUTS
%   isMedium: Logical value if medium exist, Logical [1 x 1]
%   iMedium: Order of any medium in its library, Double [1 x 1]
%   mediumType: Medium type, Char [1 x N]
%
%  SYNTAX
%
%  isMedium = isAnyMedium(objMedium, mediumName)
%
% This syntax returns only logical value if medium exist or not.
%
%  [isMedium, iMedium, mediumType] = isAnyMedium(objMedium, mediumName)
%
% In this case method returns also order of medium in material library and
% medium type.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
