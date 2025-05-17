%% findSuperMaster find Master of obj Masters
% This method finds reference to the most upper MasterObject of GeomObject.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]]
%
%  OUTPUTS
%   superMaster: super MasterObject, GeomObject [1 x 1]
%
%  SYNTAX
%
%  superMaster = obj.findSuperMaster()
%
% Method findSuperMaster finds Master object that is put above all Masters of
% GeomObject _obj_. If _obj_ has no Master object, then _obj_ itself is given
% back as _superMaster_ obejct.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
