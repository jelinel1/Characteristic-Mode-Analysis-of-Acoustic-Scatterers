%% Evaluate similarity matrix
% Similarity matrix converts active triangles between two different
% discretizations. Its implementation allows to enable particular triangles
% based on user defined weight.
%
%  INPUTS:
%     Mesh1 - mesh structure for discretization with N1 triangles
%     Mesh2 - mesh structure for discretization with N2 triangles
%
%  OUTPUTS:
%     similarityMatrix - similarity matrix [N2 x N1] if N2 > N1,
%                        [N1 x N2] otherwise
%
%  NOTES:
%     1/ variables VERT and FACE denotes sparse mesh and variables
%        NODE and TRIA are used for densier mesh throughout the code
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Vojtech Neuman, CTU in Prague, vojtech.neuman@fel.cvut.cz
