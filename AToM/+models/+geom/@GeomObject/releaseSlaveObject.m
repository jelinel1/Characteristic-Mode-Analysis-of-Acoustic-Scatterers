%% releaseSlaveObjects restore SlaveOjects if MasterObject deleted
% This method restores parameters of slave objects of deleted master object.
%
%  INPUTS
%   masterObj: master object, GeomObject [1 x 1]
%   slaveObj: slave object to be released, GeomObject [1 x 1]
%   idNums: identifier of the Bool. operation that is deleted, double [1 x 1]
%
%  SYNTAX
%
%  masterObj.releaseSlaveObject(slaveObj, idNums)
%
% Method releaseSlaveObject deletes connection between slave object _slaveObj_
% and master object _masterObj_. Properties masterObj.curve, pubSubList and
% slaveObj.master, isSlave and isMeshed are updated. SlaveObj is again
% registered as subscriber of Variables from masterObj.pubsublist. Also,
% transformations after bool. operation specified by numbers _idNums_ are copied
% from masterObj.history to slaveObj.history.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
