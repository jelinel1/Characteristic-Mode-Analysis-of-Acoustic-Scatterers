%% copy copy object along vector
% This function copies specified object along vector N-times.
%
%  INPUTS
%   obj: GeomObject
%   vect: defines where object should be copied, double [1 x 3]
%   newName: name for new object, char [1 x N]
%
%  SYNTAX
%
%  obj.copy(vect, newName)
%
% New object is produced based on definition of _obj_. The distance between
% origin and new Object is defined by euclidean distance of vector _vect_.
% Produced object is named according to char specified in _newName_.
% from 1.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
