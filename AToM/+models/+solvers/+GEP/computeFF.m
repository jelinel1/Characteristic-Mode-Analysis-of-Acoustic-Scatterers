%% computeFF compute modal far-fields
% Compute modal far-fields.
%
%  INPUTS
%   eigVec: eigvectors, double [nEdges x nModes x nFreq]
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struct [1 x 1]
%   frequencyList: list of frequencies, double [nFreq x 1]
%   theta: vector of theta points, double [nTheta x 1]
%   phi: vector of phi points, double [nPhi x 1]
%   gepOptions: options settings, struct [1 x 1]
%   FF: far-field matrice, double [nTheta x nPhi x nFreq x nMode]
%   statusWindow: status window for GUI, GEP status window [1 x 1]
%
%  OUTPUTS
%   FF: far-field matrice, double [nTheta x nPhi x nFreq x nMode]
%
%  SYNTAX
%
%  FF = computeFF(eigVec, mesh, basisFcns, frequencyList, theta, phi)
%  FF = computeFF(eigVec, mesh, basisFcns, frequencyList, theta, phi, ...
%     gepOptions)
%  FF = computeFF(eigVec, mesh, basisFcns, frequencyList, theta, phi, ...
%     gepOptions, FF)
%  FF = computeFF(eigVec, mesh, basisFcns, frequencyList, theta, phi, ...
%     gepOptions, FF, statusWindow)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
