%% geomUpdate update routine of Geom object
% This method is called whenerver some object included in Geom container is
% changed or new object is to be included.
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
%  sameObj = obj.geomUpdate(newObj)
%
% This method is called every time when new object is to be added to Geom or any
% old object is to be updated. If any object in the Geom container has exactly
% the same defining properties, the function returns this object. The
% newObj can be deleted or not, according to value in variable
% preferencesControlUniqueObj (true = merge, false = no control).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
