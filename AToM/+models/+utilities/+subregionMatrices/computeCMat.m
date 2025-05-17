%% computeCMat computes subregion matrix C
% Computes subregion matrix C which can be use to 'cut' any vector/matrix
% quantity connected to given mesh and basis functions structure.
% C matrix allows to reduce any vector/matrix quantity and cut out any part
% of the structure or create 'holes' into structure which is described
% by this matrix, these parts are defined by one or more polygons.
%
% Properies of C matrix:
%
%      zMatSmall = C' * zMatBig * C
%      ISmall = C' * IBig
%      IBig = C * ISmall
%
% where
%
%  zMatBig   - impedance matrix of full structure,
%  zMatSmall - impedance matrix of structure with 'holes',
%  IBig      - vector of expansion coefficient which belongs to zMatBig,
%  ISmall    - reduced vector of expansion coefficients which belongs
%              to zMatSmall
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1],
%   polygons:  cell of polygons defined by border points, cell[N x 1]
%               N ~ number of polygons
%               polygons are defined by border points using coordinates
%               [x, y], double [M x 2]
%               M ~ number of border points
%   type:      type of cut flag, double [1 x 1],
%               >= 0 ~ cut out part of the structure (positive cut)
%               < 0  ~ create 'holes' into the structure (negative cut)
%
%  OUTPUTS
%   C:               subregion matrix, double [P X Q]
%                     P ~ size of 'big' quantity
%                     Q ~ size of 'small' quantity
%   newMesh:         new mesh structure, struct [1 x 1]
%   newBasisFcns:    basis functions struct, modified to be in proper
%                    order to 'small' quantities, struct [1 x 1]
%   basisFcnsOrder:  vector which describes new order of basis funtions
%                    corresponding to 'small' quantities, double [Q x 1]
%
%  SYNTAX
%
%  [C, newMesh] = computePositiveCMat(mesh, basisFcns, polygons)
%  [C, newMesh, newBasisFcns] = computePositiveCMat( ...
%    mesh, basisFcns, polygons, 1)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
