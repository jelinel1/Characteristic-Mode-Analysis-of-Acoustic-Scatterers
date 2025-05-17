%% Z2T converts Z matrix to T, G and P matrices
% Convertor combining impedance matrix Z and projection matrices S1 and
% S4 to produce transition matrix T, internal scattering matrix G, and
% penetration matrix P.
%
%  INPUTS
%   Z:   impedance matrix, double [N x N]
%   S1:  S matrix, p = 1, projection piece-wise BF <-> spherical waves,
%          double [M x N]
%   S1:  S matrix, p = 4, projection piece-wise BF <-> spherical waves,
%          double [M x N]
%
%  OUTPUTS
%   T:   transition matrix (external scattering) T, double [M x M]
%   G:   internal scattering matrix G, double [M x M]
%   P:   penetration matrix P, double [M x M]
%
%  SYNTAX
%   T = Z2T(Z, S1);
%   [T, G, P] = Z2T(Z, S1, S4);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2021, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
