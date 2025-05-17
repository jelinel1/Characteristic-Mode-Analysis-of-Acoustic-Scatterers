%% INTEGRATIONPOINTS Calculates integration points in Cartesian coordinates
% According to mesh and integration points in barycentric coordinates calculates
% integration points in Cartesian coordinates.
%
%  FIXME: inputs
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struct [1 x 1]
%   quadPoints: barycentric coordinates of points, double [N x 3]
%
%  OUTPUTS
%   integrationPoints: cartesian coordinates of points, double [N x 3]
%
%  SYNTAX
%   integrationPoints = integrationPoints(mesh, basisFcns, quadPosition);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
