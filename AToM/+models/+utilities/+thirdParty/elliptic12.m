% ELLIPTIC12 evaluates the value of the Incomplete Elliptic Integrals
% of the First, Second Kind and Jacobi's Zeta Function.
%
%   [F,E,Z] = ELLIPTIC12(U,M,TOL) where U is a phase in radians, 0<M<1 is
%   the module and TOL is the tolerance (optional). Default value for
%   the tolerance is eps = 2.220e-16.
%
%   ELLIPTIC12 uses the method of the Arithmetic-Geometric Mean
%   and Descending Landen Transformation described in [1] Ch. 17.6,
%   to determine the value of the Incomplete Elliptic Integrals
%   of the First, Second Kind and Jacobi's Zeta Function [1], [2].
%
%       F(phi,m) = int(1/sqrt(1-m*sin(t)^2), t=0..phi);
%       E(phi,m) = int(sqrt(1-m*sin(t)^2), t=0..phi);
%       Z(phi,m) = E(u,m) - E(m)/K(m)*F(phi,m).
%
%   Tables generating code ([1], pp. 613-621):
%       [phi,alpha] = meshgrid(0:5:90, 0:2:90);                  % modulus and phase in degrees
%       [F,E,Z] = elliptic12(pi/180*phi, sin(pi/180*alpha).^2);  % values of integrals
%
%   See also ELLIPKE, ELLIPJ, ELLIPTIC3, THETA, AGM.
%
%   References:
%   [1] M. Abramowitz and I.A. Stegun, "Handbook of Mathematical Functions",
%       Dover Publications", 1965, Ch. 17.1 - 17.6 (by L.M. Milne-Thomson).
%   [2] D. F. Lawden, "Elliptic Functions and Applications"
%       Springer-Verlag, vol. 80, 1989
