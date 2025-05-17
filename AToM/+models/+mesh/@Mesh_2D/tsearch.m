%TSEARCH Search for enclosing Delaunay triangle
%
%   TSEARCH will be removed in a future release.
%   Use DelaunayTri/pointLocation instead.
%
%   T = TSEARCH(X,Y,TRI,XI,YI) returns the index of the enclosing Delaunay
%   triangle for each point in XI,YI so that the enclosing triangle for
%   point (XI(k),YI(k)) is TRI(T(k),:).  TSEARCH returns NaN for all
%   points outside the convex hull.  Requires a triangulation TRI of the
%   points X,Y obtained from DELAUNAY.
%
%   See also DelaunayTri, DELAUNAY, TSEARCHN, DELAUNAYN.
