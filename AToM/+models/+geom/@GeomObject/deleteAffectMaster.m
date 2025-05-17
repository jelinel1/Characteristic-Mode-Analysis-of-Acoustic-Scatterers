%% deleteAffectMaster slaveObject informs its Master when Slave deleted
% This method is cares about masterObject of slaveObject, when slaveObject
% deleted.
%
%  INPUTS
%   slaveObj: slave object, GeomObject [1 x 1]
%
%  SYNTAX
%
%  slaveObj.deleteAffectMaster()
%
% Method deleteAffectMaster finds masterObject. Then, bool operation with slave
% is deleted from masterObjects history and master is recomputed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
