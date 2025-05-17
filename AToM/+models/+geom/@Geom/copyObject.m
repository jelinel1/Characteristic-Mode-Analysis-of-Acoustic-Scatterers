%% copy copy object along vector
% This function copies specified object along vector N-times.
%
%  INPUTS
%   obj: Geom [1 x 1]
%   objName: GeomObject, char [1 x N]
%   vect: defines where object should be copied, double [1 x 3]
%   nNew: optional, number of copied objects, double [1 x 1]
%   newName: optional, names for new objects, char [1 x N]
%   type: optional, type of GeomObject
%
%  SYNTAX
%
%  obj.copyObject(objName, vect)
%
% New object is placed along vector _vect_ having same properties as origin
% object _objName_.
%
%  obj.copyObject(objName, vect, nNew)
%
% Several new objects are produced based on definition of _objName_. Number of
% objects is defined by _nNew_. The distance between two neighbours is defined
% by euclidean distance of vector _vect_.
%
%  obj.copyObject(objName, vect, nNew, newName)
%
% Produced objects ara named according to char specified in _newName_ numbered
% from 1.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
