%% calculateRCS calculate radar cross section
%
% INPUTS
%  obj:            Results object, Results [1 x 1]
%  dataName:       data name, char [1 x N]
%  slotName:       slot name, char [1 x N]
%  listPointName:  listPoint name, char [1 x N]
%  thetaForce:     forced value theta, double [1 x 1], [N x 1]
%  phiForce:       forced value phi, double [1 x 1], [N x 1]
%
% SYNTAX
%  results.calculateRCS(dataName, slotName, listPointName)
%  results.calculateRCS(dataName, slotName, listPointName, pi/2, pi)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
