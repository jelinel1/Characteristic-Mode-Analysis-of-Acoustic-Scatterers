% CHECKGEOMETRY: Check a geometry input for MESH2D.
%
%  node  : Nx2 array of XY geometry nodes
%  edge  : Mx2 array of connections between nodes in NODE. (Optional)
%  face  : cell array of edges in each face
%  hdata : Structure array defining size function data.
%
% The following checks are performed:
%
%  1. Unique edges in EDGE.
%  2. Only nodes referenced in EDGE are kept.
%  3. Unique nodes in NODE.
%  4. No "hanging" nodes and no "T-junctions".
%
% Checks for self-intersecting geometry are NOT done because this can be
% expensive for big inputs.
%
% HDATA and FACE may be re-indexed to maintain consistency.
