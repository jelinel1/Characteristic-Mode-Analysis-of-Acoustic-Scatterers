%% cosRad compute cos function in radians
% This static method computes the cos function with no error for k*pi/2 values.
%
%  INPUTS
%   angle: angles in rad, double [N x M]
%
%  OUTPUTS
%   val: true cos values, double [N x M]
%
%  SYNTAX
%
%  val = models.utilities.geomPublic.cosRad(angle)
%
% The cos function value for _angle_ (in [rad]) is computed using the degree
% functions sind and cosd to avoid pi double precission errors.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode
