%% computeDifferences find derivative approximation at defined point
% function computes central differences of function defined by user at point
% defined by user.
%
%  INPUTS
%   objectiveFunc: objective function, cell of handles [1 x 1]
%   x0: place to compute differences, double [N x 1]
%   step: optional, step to compute differences, double [1 x 1]/[N x 1]
%   f0: function values, double [1N x 1]
%
%  OUTPUTS
%   dfdx: value of difference at chosen point, double [1 x N]
%   Hx: Hessian matrix, double [N x N]
%
%  SYNTAX
%
%  [dfdx, Hx] = models.utilities.geomPublic.compDifferences(objFunc, x0,
% step, f0)
%
% Function compDifferences computes finite central differences of function
% _objFunc_ at position specified in _x0_. The differences are computed using
% function values at positions defined in _step_. Also the Hessian matrix is
% approcimate. Outputs are passed at variables _dfdx_ and _Hx_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode
