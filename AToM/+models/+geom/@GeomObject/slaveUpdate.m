%% slaveUpdate update current object and its slaves
% This method updates all slave objects of current object and then the object
% itself.
%
%  INPUTS
%   object: object to be updated, GeomObject [1 x 1]
%
%  SYNTAX
%
%  object.slaveUpdate()
%
% Method slaveUpdate first calls update of _object's_ slaves. Then, it
% reconstructs the _object_ itself.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
