%% addDielectric creates new dielectric into the material library.
% This method creates dielectric medium into AToM material library. This
% material can be used in the solver computing by Boundary Elements Method.
%
%  INPUTS
%   mediumName: Dielectric name, Char [1 x N]
%   Property: Name of medium property, Char [1 x N]
%   Value: Value of medium property, Char [1 x N] or Double [1 x 1]
%
%  SYNTAX
%
%  addDielectric(mediumName)
%
% Method is possible to call with mediumName input only. In this case are set
% default values of dielectric properties.
%
%  addDielectric(mediumName, 'Property', 'Value')
%
% This case specifies medium properties using one or more Property, Value pair
% arguments. It is possible to specify only some Property, Value pair. The
% others will be set as default values.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
