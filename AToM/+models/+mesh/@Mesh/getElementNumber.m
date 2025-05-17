%% getelementnumber find border elements on 1D discrete port
%  Calculates border elements on 1D discrete ports and its polarity
%
%  INPUTS
%   obj: Mesh object
%   portPositio: position of 1D discrete port,  [1 x 3]
%   feederDirection: feeding vector, [1 x 3]
%   meshObjectName: name of MeshObject, string [1 x N]
%
%  OUTPUTS
%   eleNum: number of elements, ordered by feederDirection [2 x  1]
%
%  SYNTAX
%
%   eleNum = getElementNumber(obj, portPosition, feederDirection, meshObjectName))
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
