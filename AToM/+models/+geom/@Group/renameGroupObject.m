%% renameGroupObject rename GroupObject in Group
% This method renames an object specified by its name _oldName_ from Group
% _obj_.
%
%  INPUTS
%   obj: Group object, [1 x 1]
%   oldNname: current object name, char [1 x N]
%   newNname: new name specified by user, char [1 x N]
%
%  OUTPUTS
%   isRenamed: logical [1 x 1]
%
%  SYNTAX
%
%  isRenamed = renameGroupObject(obj, oldName, newName)
%
% The GroupObject specified by _oldName_ is renamed to _newName_ if found in
% Group object _obj_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
