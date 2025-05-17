%  REFINE: Refine triangular meshes.
%
% Quadtree triangle refinement is performed, with each triangle split into
% four sub-triangles. The new triangles are created by joining nodes
% introduced at the edge midpoints. The refinement is "quality" preserving,
% with the aspect ratio of the sub-triangles being equal to that of the
% parent.
%
%  UNIFORM REFINEMENT:
%
%  [p,t] = refine(p,t);
%
%  p : Nx2 array of nodal XY coordinates, [x1,y1; x2,y2; etc]
%  t : Mx3 array of triangles as indices, [n11,n12,n13; n21,n22,n23; etc]
%
%  NON-UNIFORM REFINEMENT:
%
% Non-uniform refinement can also be performed by specifying which
% triangles are to be refined. Quadtree refinement is performed on
% specified triangles. Neighbouring triangles are also refined in order to
% preserve mesh compatibility. These triangles are refined using
% bi-section.
%
%  [p,t] = refine(p,t,ti);
%
%  ti : Mx1 logical array, with Ti(k) = TRUE if kth triangle is to be
%       refined
%
% Functions defined on the nodes in P can also be refined using linear
% interpolation through an extra input:
%
%  [p,t,f] = refine(p,t,ti,f);
%
%  f : NxK array of nodal function values. Each column in F corresponds to
%      a dependent function, F(:,1) = F1(P), F(:,2) = F2(P), etc.
%
% It is often useful to smooth the refined mesh using SMOOTHMESH. Generally
% this will improve element quality.
%
% Example:
%
%   [p,t] = refine(p,t,ti);
%
% See also SMOOTHMESH, MESH2D
