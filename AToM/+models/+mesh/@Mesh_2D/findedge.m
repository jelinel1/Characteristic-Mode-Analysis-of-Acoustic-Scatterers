%  FINDEDGE: Locate points on edges.
%
% Determine which edges a series of points lie on in a 2D plane.
%
%  i = findedge(p,node,edge,tol);
%
% INPUTS
%
%  P     : An Nx2 array of xy co-ordinates of points to be checked.
%  NODE  : An Kx2 array of xy co-ordinates of edge endpoints.
%  EDGE  : An Mx2 array of edges, specified as connections between the
%          vertices in NODE: [n1 n2; n3 n4; etc].
%  TOL   : Tolerance used when testing points.
%
% OUTPUTS
%
%  I     : Nx1 array of edge numbers, corresponding to the edge that each
%          node lies on. Nodes that do not lie on any edges are assigned 0.
%
% See also INPOLYGON
