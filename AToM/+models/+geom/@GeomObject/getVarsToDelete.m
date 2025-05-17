%% getVarsToDelete slaveObject collects all variables that should be deleted
% This method collects all the variables from definition and transformation
% of slaveObject to be deleted in its masterObj.
%
%  INPUTS
%   slaveObj: slave object, GeomObject [1 x 1]
%
%  OUTPUTS
%   varsToDelete: variables to be deleted, Variable [1 x nVars]
%
%  SYNTAX
%
%  varsToDelete = slaveObj.getVarsToDelete()
%
% Method getVarsToDelete finds all variables that were created by the _slaveObj_
% ans its transformations.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
