%% plotFarField generates plot of far-field
% Creates plot of far-field.
%
%  INPUTS
%  (parameters)
%   'mesh'          mesh struct created by AToM, struct [1 x 1]
%   'basisFcns'     basis functions struct created by AToM, struct [1 x 1]
%   'iVec'          vector of expansion coeficients, double [N x 1]
%   'theta'         vector of points in theta spherical coordinate,
%                    double [1 x N]
%   'phi'           vector of points in phi spherical coordinate,
%                    double [1 x N]
%   'frequency'     value of frequency, double [1 x 1]
%   'farField'      data for given theta and phi, double [N x M]
%   'options'       ploting options, list below, struct [1 x 1]
%   'handles'       handles to the modification, struct [1 x 1]
%   'template'      template containing graphic rules, struct [1 x 1]
%   'radius'        value for scaling size of plotted far-field,
%                    double [1 x 1]
%   'userFunction'  function handle used to choose what to plot,
%                    function handle [1 x 1],
%                    default function @(ff) abs(ff.D)
%
%  Options structure, logical [1 x 1] in each field
%   options.showFarField               generate surface of far-field
%   options.showSphericalCoordinates   generate spherical coordinates to
%                                     figure
%   options.showCartesianCoordinates   generate cartesian coordinates to
%                                     figure
%   options.showColorBar               show colorbar
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotFarField('mesh', mesh, 'basisFcns', bf, ...
%   'iVec', iVec, 'frequency', frequency);
%  handles = results.plotFarField('theta', thetaVector, ...
%  'phi', phiVector, 'farField', farFieldMatrix)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
