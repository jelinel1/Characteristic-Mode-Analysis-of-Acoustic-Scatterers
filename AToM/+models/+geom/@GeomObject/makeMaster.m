%% makeMaster make object a master object to a slave object
% This method modifies an object to be a master object to a slave object.
%
%  INPUTS
%   masterObj: master object, GeomObject [1 x 1]
%   segs: segments start and end points, double [2*nSegs x 3]
%   params: parametric segments, double [2*nSegs x 1]
%   types: type of segment, curve #, cycle #, double [nSegs x 3]
%   isHoles: solid (0) or hole (1) segment identifier, logical [nSegs, 1]
%   slaveObj: slave object, GeomObject [1 x 1]
%   callerName: optional, which function called, char [1 x N]
%
%  SYNTAX
%
%  masterObj.makeSlave(slaveObj)
%
% Method makeMaster modifies an object _masterObj_ to be a master to an object
% _slaveObj_. The slave object is added to a master object list of curveas and
% update method of _masterObject_ is called.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
