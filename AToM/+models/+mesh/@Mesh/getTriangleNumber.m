%% gettriangleNumber find border elements on 2D discrete port
% Calculates border elements on 2D discrete ports and its polarity
%
%  INPUTS
%   obj: Mesh object
%   portPositio: position of 2D discrete port,  [2 x 3]
%   feederDirection: feeding vector, [1 x 3]
%   meshObjectName: name of MeshObject, string
%
%  OUTPUTS
%   eleNum: number of elements, ordered by feederDirection [N x  c]
%
%  SYNTAX
%
%   [triNum, path] = getTriangleNumber(obj, edgePosition, feederDirection, meshObjectName)
%   triNum = getTriangleNumber(obj, edgePosition, feederDirection, meshObjectName)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
