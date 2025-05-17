%% bary2cart1D converts barycentric coords to component of Cartesian system
% The function obtains selected component (x/y/z) of Cartesian coordinates
% for points described on given elements using barycentric coordinate system.
%
%  INPUTS
%   nodes: list of nodes, double [nNodes x nDims]
%   elementNodes: list of element nodes, double [nElements x nNodesPerElement]
%   barPoints: barycentric coordinates of points,
%              double [nPoints x (nNodesPerElement-1)]
%   component: component number (comp <= nDims), double [1 x 1]
%
%  OUTPUTS
%   cartComp: Cartesian component for all points in all elements,
%             double [nPoints x nElements]
%
%  SYNTAX
%
%  cartesian = bary2cart1D(nodes, elementNodes, barPoints, component)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
