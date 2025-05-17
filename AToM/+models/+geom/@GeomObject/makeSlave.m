%% makeSlave make object a slave object to a master object
% This method modifies an object to be a slave object to a master object.
%
%  INPUTS
%   slaveObj: slave object, GeomObject [1 x 1]
%   masterObj: master object, GeomObject [1 x 1]
%   callerName: optional, which function called, char [1 x N]
%
%  SYNTAX
%
%  slaveObj.makeSlave(masterObj)
%
% Method makeSlave modifies an object _slaveObj_ to be a slave to an object
% _masterObject_. The master object is registred to a slave object as a
% Subscriber. The slave object becomes invisible and is not meshed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
