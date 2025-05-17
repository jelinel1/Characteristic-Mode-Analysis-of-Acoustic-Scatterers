%% bary2cart obtains Cartesian components of barycentric coordinates
% The function converts list of points _quadPoints_ expressed in barycentric
% coordinates to a list of points expressed in Cartesian coordinates for all
% _elementNodes_.
%
%  INPUTS
%   nodes: list of nodes, double [nNodes x nDims]
%   elementNodes: list of element nodes, double [nElements x nNodesPerElement]
%   barycentric: barycentric coordinates of points,
%              double [nPoints x (nNodesPerElement-1)]
%
%  OUTPUTS
%   cartComp: Cartesian components of all points in all elements,
%             double [nPoints x nElements]
%
%  SYNTAX
%
%  cartesian = bary2cart3D(nodes, elementNodes, barycentric)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
