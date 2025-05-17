%% getLineIntersectingTwoPlanes find intersection line between two planes
% This function computes line that is intersecting both planes defined in 3D.
%
%  INPUTS
%   norm1: normal of planes from set 1, double [nP1 x 3]
%   point1: point on planes from set 1, double [nP1 x 3]
%   norm2: normal of planes from set 2, double [nP2 x 3]
%   point2: point on planes from set 2, double [nP2 x 3]
%
%  OUTPUTS
%   isParallel: are planes parallel, logical [nP1 x nP2]
%   interVect: vector of line, double [nP1 x 3*nP2]
%     .x: x-coordinates, double [nV1 x nV2]
%     .y: y-coordinates, double [nV1 x nV2]
%     .z: z-coordinates, double [nV1 x nV2]
%   interPoint: point on line, double [nP1 x 3*nP2]
%     .x: x-coordinates, double [nV1 x nV2], in [m]
%     .y: y-coordinates, double [nV1 x nV2], in [m]
%     .z: z-coordinates, double [nV1 x nV2], in [m]
%
%  SYNTAX
%
%  [isParallel, interVect, interPoint] = models.utilities.geomPublic. ...
% getLineIntersectingTwoPlanes(norm1, point1, norm2, point2)
%
% Function getLineIntersectingTwoPlanes finds intersection line of planes
% defined by their normal (_norm1_ and _norm2_) and point (_point1_ and
% _point2_). The curve is found in form of point (_interPoint_) and vector
% (_interVecto_).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
