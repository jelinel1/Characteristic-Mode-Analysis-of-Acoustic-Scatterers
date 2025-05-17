%% getPointsOnEquationCurve compute points on EquationCurve
% This function computes position of points that defines EquationCurve.
%
%  INPUTS
%   nPoints: number of points on EllipseArc, double [1 x 1]
%   interval: parameter interval, double [1 x 2]
%   eqX: handle_function [1 x 1]
%   eqY: handle_function [1 x 1]
%   eqZ: handle_function [1 x 1]
%
%  OUTPUTS
%   dP: points on line, double [nPoints x 3]
%
%  SYNTAX
%
%  dP = getPointsOnEquationCurve(nPoints, interval, eqX, eqY, eqZ)
%
% Points _dP_ are computed on the EquationCurve defined by _interval_, _eqX_,
% _eqY_, _eqZ_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
