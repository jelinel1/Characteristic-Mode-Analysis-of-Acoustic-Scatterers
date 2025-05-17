%  CONNECTIVITY: Assemble connectivity data for a triangular mesh.
%
% The edge based connectivity is built for a triangular mesh and the
% boundary nodes identified. This data should be useful when implementing
% FE/FV methods using triangular meshes.
%
%  [e,te,et2,bnd] = connectivity(p,t);
%
%  p   : Nx2 array of nodes coordinates, [x1,y1; x2,y2; etc]
%  t   : Mx3 array of triangles as indices, [n11,n12,n13; n21,n22,n23; etc]
%
%  e   : Kx2 array of unique mesh edges - [n11,n12; n21,n22; etc]
%  te  : Mx3 array of triangles as indices into E, [e11,e12,e13;
%                                                   e21,e22,e23; etc]
%  e2t : Kx2 array of triangle neighbours for unique mesh edges -
%        [t11,t12; t21,t22; etc]. Each row has two entries corresponding to
%        the triangle numbers associated with each edge in E. Boundary
%        edges have e2t(i,2)=0.
%  bnd : Nx1 logical array identifying boundary nodes. P(i,:) is a boundary
%        node if BND(i)=TRUE.
%
% See also MESH2D, REFINE
