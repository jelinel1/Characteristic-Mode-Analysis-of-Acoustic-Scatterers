%  QUADTREE: 2D quadtree decomposition of polygonal geometry.
%
% The polygon is first rotated so that the minimal enclosing rectangle is
% aligned with the Cartesian XY axes. The long axis is aligned with Y. This
% ensures that the quadtree generated for a geometry input that has
% undergone arbitrary rotations in the XY plane is always the same.
%
% The bounding box is recursively subdivided until the dimension of each
% box matches the local geometry feature size. The geometry feature size is
% based on the minimum distance between linear geometry segments.
%
% A size function is obtained at the quadtree vertices based on the minimum
% neighbouring box dimension at each vertex. This size function is gradient
% limited to produce a smooth function.
%
% The quadtree is triangulated to form a background mesh, such that the
% size function may be obtained at any XY position within the domain via
% triangle based linear interpolation. The triangulation is done based on
% the quadtree data structures directly (i.e. NOT using Qhull) which is
% more reliable and produces a consistently oriented triangulation.
%
% The initial rotations are undone.
%
%  node  : [x1,y1; x2,y2; etc] geometry vertices
%  edge  : [n11,n12; n21,n22; etc] geometry edges as connections in NODE
%  hdata : User defined size function structure
%  dhmax : Maximum allowalble relative gradient in the size function
%  wbar  : Handle to progress bar from MESH2D
%
%   p    : Background mesh nodes
%   t    : Background mesh triangles
%   h    : Size function value at p
