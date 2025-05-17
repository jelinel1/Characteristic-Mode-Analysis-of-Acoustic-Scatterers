%% addFixPoints adds fix points to existing mesh
%
%  INPUTS
%   nodes: 3D points, double [N x 3]
%   connectivityList: triangle connectivity, double [N x 3]
%   hdata: mesh options structure
%   ports1D: fix points to add, double [N x 2]
%   fix: fix points in nodes matrix, double [N x 1]
%
%  OUTPUTS
%   newNodes: 3D points, double [N x 3]
%   newConnectivityList: triangle connectivity, double [N x 3]
%
%  SYNTAX
%
%   [newNodes, newConnectivityList] = obj.addFixPoints( nodes,
%   connectivityList, hdata, ports1D, fix );
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
