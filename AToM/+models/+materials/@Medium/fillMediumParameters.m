%% fillMediumParameters specify medium parameters.
% This method fills 'mediumStruct' by user specified medium parameters which are
% also validate here.
%
%  INPUTS
%   mediumStruct: Medium parameters, Struct
%   mediumParameters: Required medium parameters, Cell array [1 x N]
%   Property: Name of medium parameter, Char [1 x N]
%   Value: Value of medium parameter, Double [1 x 1] or Char [1 x N]
%
%  OUTPUTS
%   mediumStruct: Medium parameters, Struct
%
%  SYNTAX
%
%  mediumStruct = ...
%     fillMediumParameters(mediumStruct, mediumParameters, 'Property', 'Value')
%
% Method take 'mediumStruct' (can be empty or filled) and sets new user 'Value'
% of 'Property'. Input 'mediumParameters' defines correct 'Property' names.
% Method returns edited 'mediumStruct' for other work with any medium.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
