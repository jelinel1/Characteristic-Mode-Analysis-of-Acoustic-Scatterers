%% getJInPoints returns values of current density in general points
% This method returns values of the current density and its divergence
% evaluated in general points given by the user or in the triangle centroids.
% The last output variable _points_ contains coordinates of the points for
% which the values were computed.
% Procedure:
% ~~~~~~~~~~
% Get topology
% 1.) find triangles for points
% 2.) find basis functions for triangles
% Solve topology
% 3.) accumulate basis function contributions to triangles
% 4.) accumulate triangle contributions to points
%
%  INPUTS
%   mesh: computational mesh
%   basisFcns: information about basis functions
%   iVec: current density coefficients, double [#unknowns x #frequencies]
%   points: Cartesian coordinates of the points, double [#points x 3]
%           This parameter is optional.
%
%  OUTPUTS
%   Jx: x component of the current density, double [#unknowns x #frequencies]
%   Jy: y component of the current density, double [#unknowns x #frequencies]
%   Jz: z component of the current density, double [#unknowns x #frequencies]
%   divJ: divergence of the current density, double [#unknowns x #frequencies]
%   points: Cartesian coordinates of the points, double [#points x 3]
%
%  SYNTAX
%
%  getJInPoints(obj, jVec, points)
%
% User defines points where the current density will be evaluated.
%
%  getJInPoints(obj, jVec)
%
% The points are not user-defined. Triangle centroids are used instead.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% docu
