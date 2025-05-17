%% recomputeSlaves reconstruct slave Objects of Master
% This method recomputes all Slave Objects of specified Master.
%
%  INPUTS
%   masterObj: master object, GeomObject [1 x 1]
%   slaveObj: object, that was already updated, GeomObject [1 x 1]
%
%  SYNTAX
%
%  masterObj.recomputeSlaves(slaveObj)
%
% Method recomputeSlaves finds all slave objects of _masterObj_ and recomputes
% their history, so that Bool. operation with master can be reperfomed. The
% object _slaveObj_ is not updated, because it has beeen already updated.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
