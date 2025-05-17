%% deleteVarsInMasters delete all Vars from deleted slaves
% This method deletes all vasr from deleted slaves that appear in
% masterObj.pubSubList.
%
%  INPUTS
%   slaveObj: slave object, GeomObject [1 x 1]
%   varsToDelete: variables to be deleted from pubSubList, Variable [1 x N]
%
%  SYNTAX
%
%  slaveObj.deleteVarsInMasters(varsToDelete)
%
% Method deleteVarsInMasters finds all variables from _varsToDelete_ in
% pubSubList of _slaveObj_s master.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
