%  INPOLY: Point-in-polygon testing.
%
% Determine whether a series of points lie within the bounds of a polygon
% in the 2D plane. General non-convex, multiply-connected polygonal
% regions can be handled.
%
% SHORT SYNTAX:
%
%   in = inpoly(p, node);
%
%   p   : The points to be tested as an Nx2 array [x1 y1; x2 y2; etc].
%   node: The vertices of the polygon as an Mx2 array [X1 Y1; X2 Y2; etc].
%         The standard syntax assumes that the vertices are specified in
%         consecutive order.
%
%   in  : An Nx1 logical array with IN(i) = TRUE if P(i,:) lies within the
%         region.
%
% LONG SYNTAX:
%
%  [in, on] = inpoly(p, node, edge, tol);
%
%  edge: An Mx2 array of polygon edges, specified as connections between
%        the vertices in NODE: [n1 n2; n3 n4; etc]. The vertices in NODE
%        do not need to be specified in connsecutive order when using the
%        extended syntax.
%
%  on  : An Nx1 logical array with ON(i) = TRUE if P(i,:) lies on a
%        polygon edge. (A tolerance is used to deal with numerical
%        precision, so that points within a distance of
%        reltol*min(bbox(node)) from a polygon edge are considered "on" the
%        edge.
%
% EXAMPLE:
%
%   polydemo;       % Will run a few examples
%
% See also INPOLYGON
