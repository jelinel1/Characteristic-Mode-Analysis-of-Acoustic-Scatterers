%% createEmptyParameterStruct creates empty struct of medium parameters.
% This method creates empty struct of medium parameters. It is important for
% preparing data for addition or editing of any medium.
%
%  INPUTS
%   mediumType: Medium type, Char [1 x N]
%
%  OUTPUTS
%   mediumStruct: Empty struct with medium parameters as a field names, Struct
%   mediumParameters: Medium parameters, Cell array [1 x N]
%
%  SYNTAX
%
%  mediumStruct = createEmptyParameterStruct(mediumType)
%
% This syntax returns only expected empty struct of medium parameters.
%
%  [mediumStruct, mediumParameters] = createEmptyParameterStruct(mediumType)
%
% Sometimes is useful to know the names of medium parameters. Second output
% returns just this.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
