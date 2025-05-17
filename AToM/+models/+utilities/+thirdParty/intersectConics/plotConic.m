% PLOTCONIC: Plots the matrixr form of an arbitrary conic:
%            Ax^2 + By^2 + 2Cx + 2Dy + Exy + F = 0
%
%        Conservative upper and lower bounds on x can be specified,
%        and will be adjusted inward.
%
%     Usage: conic(K,xBounds)
%
%             K = conic matrix
%             xBounds, yBounds = maximum x upper and lower bounds, by default [-50,50]
%
% the homogeneous representation of a conic is a matrix
% m = [A C D; C B E; D E F] that represents the equation
% A x^2 + B y^2 + 2C xy + 2D x + 2Ey + F = 0
