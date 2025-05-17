%% editMedium edits parameters of already existing medium.
% This is general function for editing any medium in the AToM material library
%
%  INPUTS
%   mediumName: Medium name, Char [1 x N]
%   Property: Name of medium property, Char [1 x N]
%   Value: Value of medium property, Char [1 x N] or Double [1 x 1]
%
%  SYNTAX
%
%  editMedium(mediumName, 'Property', 'Value')
%
% This case specifies medium properties using one or more Property, Value pair
% arguments. It is possible to specify only some Property, Value pair.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
