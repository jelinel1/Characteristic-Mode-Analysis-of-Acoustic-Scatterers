%% changeSubscribers change Subscribers of Variables from Slave to Master
% This method subscribers of Variables from an SalveObject to its MasterObject.
%
%  INPUTS
%   masterObj: master object, GeomObject [1 x 1]
%   slaveObj: slave object, GeomObject [1 x 1]
%
%  SYNTAX
%
%  masterObj.changeSubscribers(slaveObj)
%
% Method changeSubscribers finds all Variables in the object _slaveObj_ and
% changes theeir subscriber to be the _masterObj_. The list of previous
% Publisher-Subscribers relations is created in _masterObj.pubSubList_ for
% future return is created.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
