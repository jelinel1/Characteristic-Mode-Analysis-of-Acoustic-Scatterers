%% doesSetterCallUpdate control if update function is executed
% This static method of GeomObject decides wether the update function of
% geometry objects is executed or not directly from the object setters.
%
%  INPUTS
%   funcName: name of the calling function
%   msg: Message object [1 x 1]
%
%  OUTPUTS
%   isUpdated: logical
%
%  SYNTAX
%
%  isUpdated = GeomObject.doesSetterCallUpdate(funcName, message)
%
% Method doesSetterCallUpdate decides if update function is called directly
% from setter or not. Some times, it is not posiible to call update function
% directly from setter (e.g. when the whole object is rotated, scaled...).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
