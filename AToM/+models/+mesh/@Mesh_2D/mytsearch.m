%  MYTSEARCH: Find the enclosing triangle for points in a 2D plane.
%
%  i = mytsearch(x,y,t,xi,yi,iguess);
%
% The indices of the triangles enclosing the points in [XI,YI] are
% returned. The triangulation T of [X,Y] must be convex. Points lying
% outside the triangulation are assigned a NaN index.
%
% IGUESS is an optional initial guess for the indicies. A full search is
% done using the standard TSEARCH function for points with an invalid
% initial guess.
