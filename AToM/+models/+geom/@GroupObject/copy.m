%% copy copy GroupObject along vector
% This function copies allobjects in specified GroupObject along vector N-times.
%
%  INPUTS
%   obj: GroupObject [1 x 1]
%   vect: defines where object should be copied, double [1 x 3]
%   nCopy: number of copy, double [1 x 1]
%   newName: new GroupObject name, char [1 x 1]
%
%  SYNTAX
%
%  newGroupObject = obj.copy(vect, nCopy, newName)
%
% New objects are produced based on definition of objects in GroupObject _obj_.
% The distance between origin and new Objects is defined by euclidean distance
% of vector _vect_. Produced objects are named according to name of origin
% objects and number of copy _nCopy_. New GroupObject is named according to
% _newName_.
%
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
