%  TINTERP: Triangle based linear interpolation.
%
%  fi = tinterp(p,t,f,pi,i);
%
%  p  : Nx2 array of nodal XY coordinates, [x1,y1; x2,y2; etc]
%  t  : Mx3 array of triangles as indices, [n11,n12,n13; n21,n22,n23; etc]
%  f  : Nx1 function vector, f(x,y)
%  pi : Jx2 matrix of interpolation points
%  fi : Jx1 interpolant function vector, fi(xi,yi)
%
% Performs nearest-neighbour extrapolation for points outside the
% triangulation.
