%% createPolygon finds nodes of polygon build by Object segments
% This method finds polygon nodes for defined object.
%
%  INPUTS
%   curves: curves [N x 1]
%   seg: start Point, end Point of segments, double [2*nSegments x 3]
%   par: parametric start Point, end Point, double [2*nSegments x 1]
%   type: type of segments, double [nSegments x 2]
%   hol: identifier if is hole segment, double [nSegments x 2]
%
%  OUTPUTS
%   polygon: resulting polygon nodes in CCW order, double [nNodes x 3]
%   holes: hole points identifier, double [nNodes x 1]
%   circumference: polygon total circumference (including holes), double [1 x 1]
%
%  SYNTAX
%
%  [polygon, holes, circumference] = models.geom.Boolean.createPolygon( ...
% curves, seg, par, type, hol)
%
% Polygon nodes _polygon_ of object _obj_ are computed according to objects
% segmentation nodes _seg_, their parametric expression _par_ and type of curve
% _type_ (col 1 - type (1 line, 2 EllipseArc, 3 EquationCurve), col2 - curve #).
% Variable _holes_ identifies hole parts of polygon nodes. Also, the total
% circumference of polygon (including its holes) is computed and saved in
% _circumference_ variable.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
