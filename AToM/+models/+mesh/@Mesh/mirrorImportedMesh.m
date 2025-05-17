%% mirrorImportedMesh mirror mesh
%  Mirrors mesh according to a mirror plane given by its normal.
%
%  INPUTS
%   obj: Mesh object, [1 x 1]
%   name: imported mesh object name, char [1 x N]
%   normal: mirror plane normal, double [1 x 3]
%   numCopies: number of copies, double [1 x 1]
%   origin: point on the mirror plane, double [1 x 3]
%
%  SYNTAX
%
%  obj.mirrorImportedMesh(name, normal);
%  obj.mirrorImportedMesh(name, normal, numCopies);
%  obj.mirrorImportedMesh(name, normal, numCopies, origin);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% docu
