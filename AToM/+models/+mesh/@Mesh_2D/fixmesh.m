%  FIXMESH: Ensure that triangular mesh data is consistent.
%
%  [p,t,pfun,tfun] = fixmesh(p,t,pfun,tfun);
%
%  p     : Nx2 array of nodal XY coordinates, [x1,y1; x2,y2; etc]
%  t     : Mx3 array of triangles as indices, [n11,n12,n13; n21,n22,n23;
%          etc]
%  pfun  : (Optional) NxK array of nodal function values. Each column in
%          PFUN corresponds to a dependent function, PFUN(:,1) = F1(P),
%          PFUN(:,2) = F2(P) etc, defined at the nodes.
%  tfun  : (Optional) MxK array of triangle function values. Each column in
%          TFUN corresponds to a dependent function, TFUN(:,1) = F1(T),
%          TFUN(:,2) = F2(T) etc, defined on the triangles.
%
% The following checks are performed:
%
%  1. Nodes not refereneced in T are removed.
%  2. Duplicate nodes are removed.
%  3. Triangles are ordered counter-clockwise.
%  4. Triangles with an area less than 1.0e-10*eps*norm(A,'inf')
%     are removed
