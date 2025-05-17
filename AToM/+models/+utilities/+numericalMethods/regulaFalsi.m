%% regulaFalsi determine root of function
% This function determines root of specified function on given interval.
%
%  INPUTS
%   funcHandle: function to be solved, function handle [1 x 1]
%   interval: interval lower and upper limit, double [1 x 2]
%   maxIter: optional, maximal number of iterations, double [1 x 1]
%   tol: optional, precision, double [1 x 1]
%
%  OUTPUTS
%   rootPos: position of root, double [1 x 1]
%   iIter: iteration number, double [1 x 1]
%
%  SYNTAX
%
%  rootPos = models.utilities.numericalMethods.regulaFalsi(funcHandle, interval)
%
% Root of function _funcHandle_ is determined on spoecified _interval_.
% Default settings of regula falsi method is used (maxIter = 100, tole = 1e-10).
%
%  rootPos = models.utilities.numericalMethods.regulaFalsi( ...
% funcHandle, interval, maxIter, tol)
%
% Settings of regula falsi method is specified by user-defined properties
% _maxIter_ and _tol_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode
