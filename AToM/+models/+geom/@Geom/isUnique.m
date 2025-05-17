%% isUnique uniqueness check for new object
% This method is checks if new object is unique in Geom or not.
%
%  INPUTS
%   obj: Geom object
%   newObj: changed/new geometry object
%
%  OUTPUTS
%   sameObj: [] or object from Geom with same properties as newObj
%
%  SYNTAX
%
%  sameObj = obj.isUnique(newObj)
%
% This method is called every time when new object is to be added to Geom or any
% old object is to be updated. If any object in the Geom container has exactly
% the same defining properties, the function returns reference to the same
% object.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
