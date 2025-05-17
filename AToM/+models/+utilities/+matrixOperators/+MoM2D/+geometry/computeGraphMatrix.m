%% Evaluate geometry operators
%  Computation of all matrix operators based on graph theory.
%
%  INPUTS:
%     Mesh - mesh structure
%     BF - basis functions structure
%
%  OUTPUTS: (B = BF.nUnknowns, T = Mesh.nTriangles, N = Mesh.nNodes)
%     M - incidence matrix of triangles graph [T x B]
%     HbNorm - adjaecency matrix of basis functions graph [B x B]
%     HtNorm - adjaecency matrix of triangles graph [T x T]
%     MnodeTria - incidence matrix between nodes and triangles [N x T]
%     MnodeBasis - incidence matrix between nodes and basis functions [N x B]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2021, Vojtech Neuman, CTU in Prague, vojtech.neuman@fel.cvut.cz
