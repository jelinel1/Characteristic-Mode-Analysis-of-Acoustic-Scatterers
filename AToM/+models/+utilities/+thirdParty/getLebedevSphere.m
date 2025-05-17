% getLebedevSphere
% @author Rob Parrish, The Sherrill Group, CCMST Georgia Tech
% @email robparrish@gmail.com
% @date 03/24/2010
%
% @description - function to compute normalized points and weights
% for Lebedev quadratures on the surface of the unit sphere at double precision.
% **********Relative error is generally expected to be ~2.0E-14 [1]********
% Lebedev quadratures are superbly accurate and efficient quadrature rules for
% approximating integrals of the form $v = \iint_{4\pi}  f(\Omega) \ \ud
% \Omega$, where $\Omega is the solid angle on the surface of the unit
% sphere. Lebedev quadratures integrate all spherical harmonics up to $l =
% order$, where $degree \approx order(order+1)/3$. These grids may be easily
% combined with radial quadratures to provide robust cubature formulae. For
% example, see 'A. Becke, 1988c, J. Chem. Phys., 88(4), pp. 2547' (The first
% paper on tractable molecular Density Functional Theory methods, of which
% Lebedev grids and numerical cubature are an intrinsic part).
%
% @param degree - positive integer specifying number of points in the
% requested quadrature. Allowed values are (degree -> order):
% degree: { 6, 14, 26, 38, 50, 74, 86, 110, 146, 170, 194, 230, 266, 302,
%   350, 434, 590, 770, 974, 1202, 1454, 1730, 2030, 2354, 2702, 3074,
%   3470, 3890, 4334, 4802, 5294, 5810 };
% order: {3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,35,41,47,53,59,65,71,77,
%   83,89,95,101,107,113,119,125,131};
%
%
% @return leb_tmp - struct containing fields:
%   x - x values of quadrature, constrained to unit sphere
%   y - y values of quadrature, constrained to unit sphere
%   z - z values of quadrature, constrained to unit sphere
%   w - quadrature weights, normalized to $4\pi$.
%
% @example: $\int_S x^2+y^2-z^2 \ud \Omega = 4.188790204786399$
%   f = @(x,y,z) x.^2+y.^2-z.^2;
%   leb = getLebedevSphere(590);
%   v = f(leb.x,leb.y,leb.z);
%   int = sum(v.*leb.w);
%
% @citation - Translated from a Fortran code kindly provided by Christoph van
% Wuellen (Ruhr-Universitaet, Bochum, Germany), which in turn came from the
% original C routines coded by Dmitri Laikov (Moscow State University,
% Moscow, Russia). The MATLAB implementation of this code is designed for
% benchmarking of new DFT integration techniques to be implemented in the
% open source Psi4 ab initio quantum chemistry program.
%
% As per Professor Wuellen's request, any papers published using this code
% or its derivatives are requested to include the following citation:
%
% [1] V.I. Lebedev, and D.N. Laikov
%    "A quadrature formula for the sphere of the 131st
%     algebraic order of accuracy"
%    Doklady Mathematics, Vol. 59, No. 3, 1999, pp. 477-481.
% mcode
