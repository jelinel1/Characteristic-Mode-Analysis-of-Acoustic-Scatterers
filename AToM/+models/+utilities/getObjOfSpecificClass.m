%% getPortsOfSpecificClass gets ports of spacific Class from array allPorts.
% Only instance of Feeding class can call this method.
%
%  INPUTS
%   allObjs: vector of heterogeneous objects, objects [M x N]
%   specClass: name of class, char [1 x N]
%
%  OUTPUTS
%   objOfSpecificClass: vector of objects of specific class, objects [N x 1]
%   logInd: logical vector of objects of specific class in allObjs matrix,
%           logical [M x N]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode
