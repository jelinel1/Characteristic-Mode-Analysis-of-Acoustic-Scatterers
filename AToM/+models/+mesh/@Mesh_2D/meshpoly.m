% MESHPOLY: Core meshing routine called by mesh2d and meshfaces.
%
% Do not call this routine directly, use mesh2d or meshfaces instead!
%
% Inputs:
%
%  NODE     : Nx2 array of geometry XY co-ordinates
%  EDGE     : Mx2 array of connections between NODE, defining geometry
%             edges
%  QTREE    : Quadtree data structure, defining background mesh and element
%             size function
%  P        : Qx2 array of potential boundary nodes
%  OPTIONS  : Meshing options data structure
%  WBAR     : Handle to progress bar
%
% Outputs:
%
%  P        : Nx2 array of triangle nodes
%  T        : Mx3 array of triangles as indices into P
%
% Mesh2d is a delaunay based algorithm with a "Laplacian-like" smoothing
% operation built into the mesh generation process.
%
% An unbalanced quadtree decomposition is used to evaluate the element size
% distribution required to resolve the geometry. The quadtree is
% triangulated and used as a backgorund mesh to store the element size
% data.
%
% The main method attempts to optimise the node location and mesh topology
% through an iterative process. In each step a constrained delaunay
% triangulation is generated with a series of "Laplacian-like" smoothing
% operations used to improve triangle quality. Nodes are added or removed
% from the mesh to ensure the required element size distribution is
% approximated.
%
% The optimisation process generally returns well shaped meshes with no
% small angles and smooth element size variations. Mesh2d shares some
% similarities with the Distmesh code:
%
%   [1] P.-O. Persson, G. Strang, A Simple Mesh Generator in MATLAB.
%       SIAM Review, Volume 46 (2), pp. 329-345, June 2004
%
%   Darren Engwirda : 2005-09
%   Email           : d_engwirda@hotmail.com
%   Last updated    : 10/10/2009 with MATLAB 7.0 (Mesh2d v2.4)
