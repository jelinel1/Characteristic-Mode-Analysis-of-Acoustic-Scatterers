%% addMedium is general method for creation any medium.
% This method creates any kind of medium. It is general private method used
% during user calling of addMetal() or addDielectric() public methods. This
% method validates only material name. Its name has to be unique and row string
% only.
%
%  INPUTS
%   mediumType: Type of medium, Char [1 x N]
%   newMaterialName: Medium name, Char [1 x N]
%   Property: Name of medium property, Char [1 x N]
%   Value: Value of medium property, Char [1 x N] or Double [1 x 1]
%
%  SYNTAX
%
%  addMedium(mediumType, newMaterialName, 'Property', 'Value')
%
% Input mediumType is specified in uper function, which this function called.
% Other inptus are inherited from users settings.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
