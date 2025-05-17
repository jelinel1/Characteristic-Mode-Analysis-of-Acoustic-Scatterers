%  SMOOTHMESH: Smooth a triangular mesh using Laplacian smoothing.
%
% Laplacian smoothing is an iterative process that generally leads to an
% improvement in the quality of the elements in a triangular mesh.
%
%  [p,t] = smoothmesh(p,t);
%
%  p     : Nx2 array of nodal XY coordinates, [x1,y1; x2,y2; etc].
%  t     : Mx3 array of triangles as indices, [n11,n12,n13;
%                                              n21,n22,n23; etc].
%  maxit : Maximum allowable iterations.
%  tol   : Convergence tolerance (Percentage change in edge length must be
%          less than TOL).
%
% If MAXIT or TOL are left empty the default values MAXIT = 20 and TOL =
% 0.01 are used.
%
%  EXAMPLE:
%
%  [p,t] = smoothmesh(p,t,10,0.05);
%
% See also MESH2D, REFINE
