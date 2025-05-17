%% plotFarFieldCut generates plot of far-field cut
% Creates plot of far-field cut.
%
%  INPUTS
%  (parameters)
%   'farField'    data for given theta and phi, double [N x M]
%   'theta'       vector of points in theta spherical coordinate,
%                double [1 x N]
%   'phi'         vector of points in phi spherical coordinate,
%                double [1 x N]
%   'thetaCut'    value of theta for cut in theta, double [1 x 1]
%   'phiCut'      value of phi for cut in phi, double [1 x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
% SYNTAX
%
%  results.plotFarFieldCut('farField', farField, 'theta', theta, ...
%    'phi', phi, 'thetaCut', thetaCut);
%  handles = results.plotFarField('farField', farField, 'theta', theta, ...
%   'phi', phi, 'thetaCut', thetaCut);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
