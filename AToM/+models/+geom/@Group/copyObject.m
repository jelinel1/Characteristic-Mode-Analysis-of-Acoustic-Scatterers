%% copy copy GroupObject along vector
% This function copies specified GroupObject along vector N-times.
%
%  INPUTS
%   obj: Group [1 x 1]
%   groupName: GroupObject name, char [1 x N]
%   vect: defines where object should be copied, double [1 x 3]
%   nNew: optional, number of copied objects, double [1 x 1]
%   newName: optional, names for new objects, char [1 x N]
%
%  SYNTAX
%
%  obj.copy(groupName, vect)
%
% New object is placed along vector _vect_ having same properties as origin
% object _groupName_.
%
%  obj.copy(groupName, vect, nNew)
%
% Several new objects are produced based on definition of _groupName_. Number of
% GroupObjects is defined by _nNew_. The distance between two neighbours is
% defined by euclidean distance of vector _vect_.
%
%  obj.copy(groupName,vect, nNew, newName)
%
% Produced GroupObjects ara named according to char specified in _newName_
% numbered from 1.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
