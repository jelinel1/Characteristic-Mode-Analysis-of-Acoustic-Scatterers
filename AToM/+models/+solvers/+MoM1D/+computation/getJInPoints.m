%% getJInPoints returns values of electric current in general points
% This method returns values of the electric current and its divergence
% evaluated in general points given by the user or in the edge centroids.
% The last output variable _points_ contains coordinates of the points for
% which the values were computed.
% Procedure:
% ~~~~~~~~~~
% Get topology
% 1.) find edges for points
% 2.) find basis functions for edges
% Solve topology
% 3.) accumulate basis function contributions to edges
% 4.) accumulate edge contributions to points
%
%  INPUTS
%   obj: MoM1D object
%   jVec: electric current coefficients, double [#unknowns x #frequencies]
%   points: Cartesian coordinates of the points, double [#points x 3]
%           This parameter is optional.
%
%  OUTPUTS
%   Jx: x component of the electric current, double [#unknowns x #frequencies]
%   Jy: y component of the electric current, double [#unknowns x #frequencies]
%   Jz: z component of the electric current, double [#unknowns x #frequencies]
%   divJ: divergence of the electric current, double [#unknowns x #frequencies]
%   points: Cartesian coordinates of the points, double [#points x 3]
%
%  SYNTAX
%
%  getJInPoints(obj, jVec, points)
%
% User defines points where the electric current will be evaluated.
%
%  getJInPoints(obj, jVec)
%
% The points are not user-defined. Triangle centroids are used instead.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
