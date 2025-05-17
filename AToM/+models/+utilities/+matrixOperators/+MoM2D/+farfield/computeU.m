%% computeU compute radiation intensity matrix
% This fucntions evaluate radiation intensity matrix and farfield vectors.
% Electric far field is defined as
% F(e,r0) = -1j*k*Z0/(4*pi) * int(e .* J(r) * exp(1j*k* r0 dot r) dS
% Using matrices, it is F(e_phi,r0) = Fphi*I and analogously for Ftheta.
% Radiation intensity is defined as
% U(e,r0) = abs(F(e,r0))^2 / (2*Z0)
% Using matrices, it is U(e_phi,r0) = I'*U*I where
% U = Fphi'*Fphi / (2*Z0). Analogous relation holds for theta component.
% see Jelinek, Capek: Optimal Currents on Arbitrarily Shaped Surfaces
% IEEE-TAP, 2017, Eqs. (49)-(56)
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFunc: basis functions, struc [1 x 1]
%   frequency: frequency, double [1 x 1]
%   theta: theta angle, double [1 x 1]
%   phi: phi angle, double, [1 x 1]
%   component: component of far-field: string {'theta' | 'phi' | 'total'}
%   quadOrder: order of quadrature, double [1 x 1]
%
%  OUTPUTS
%   U: radiation intensity matrix, double [nBF x nBF]
%   Fphi: phi component of far-field: [1 x nBF]
%   Ftheta: theta component of far-field: [1 x nBF]
%
%  SYNTAX
%
%  [U, Fphi, Ftheta] = computeU(mesh, basisFunc, frequency, theta, phi)
%  [U, Fphi, Ftheta] = computeU(mesh, basisFunc, frequency, theta, ...
%    phi, component)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2021, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
