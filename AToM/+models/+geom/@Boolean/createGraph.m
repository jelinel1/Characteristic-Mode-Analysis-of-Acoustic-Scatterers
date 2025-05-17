%% createGraph finds nodes of graph build by Object segments
% This method finds graph nodes for defined object.
%
%  INPUTS
%   curves: curves [N x 1]
%   seg: start Point, end Point of segments, double [2*nSegments x 3]
%   par: parametric start Point, end Point, double [2*nSegments x 1]
%   type: type of segments, double [nSegments x 2]
%
%  OUTPUTS
%   graph: resulting polygon nodes in CCW order, double [nNodes x 3]
%   circumference: polygon total circumference (including holes), double [1 x 1]
%
%  SYNTAX
%
%  [graph, circumference] = models.geom.Boolean.createGraph( ...
% curves, seg, par, type)
%
% Graph nodes _graph_ of object specified by its curves _cutves_ are computed
% according to objects segmentation nodes _seg_, their parametric expression
% _par_ and type of curve _type_ (col 1 - type (1 line, 2 EllipseArc,
% 3 EquationCurve), col2 - curve #).
% Also, the total circumference of graph is computed and saved in
% _circumference_ variable.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
