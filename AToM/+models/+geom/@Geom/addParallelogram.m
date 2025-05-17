%% addParallelogram include Parallelogram to Geom object container
% This method adds a new object Parallelogram to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   lLC: low left corner position, char [1 x N]/double [1 x 3]
%   lRC: low right corner position, char [1 x N]/double [1 x 3]
%   hLC: high left corner position, char [1 x N]/double [1 x 3]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addParallelogram(lLC, lRC, hLC)
%
% The object of type Parallelogram specified by three corners _lLC_, _lRC_,
% _hLC_ is created in Geom.
%
%  objName = obj.addParallelogram(lLC, lRC, hLC, name)
%
% The object of type Parallelogram specified by _lLC_, _lRC_, _hLC_
% is created in Geom. The name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
