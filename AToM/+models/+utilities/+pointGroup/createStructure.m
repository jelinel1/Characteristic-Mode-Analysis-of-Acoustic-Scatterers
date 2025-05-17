%% createStructure create structure from list below
% Create structure from list below
%
%  INPUTS
%   structureNo: number of example, double [1 x 1]
%   structureSettingsInput: structure with specification, struct [1 x 1]
%   showMesh: show mesh, logical [1 x 1]
%
%  OUTPUTS
%   mesh: mesh structure, struct [1 x 1]
%   symmetryOperations: list of symmetry operations, cell [nSymmetries x 1]
%   pointGroup: name of point group, char [N x 1]
%   atom: object of Atom, where structure is prepared, Atom [1 x 1]
%
%  SYNTAX
%
%  [mesh, symmetryOperations, pointGroup, atom] = createStructure(structureNo)
%  [mesh, symmetryOperations, pointGroup, atom] = ...
%    createStructure(structureNo, structureSettingsInput)
%  [mesh, symmetryOperations, pointGroup, atom] = ...
%    createStructure(structureNo, structureSettingsInput, showMesh)
%
% |  n | group | shape                             | specifiing variables
% -----------------------------------------------------------------------
% |  0 |  C1   | arbitrary shape                   |
% |  1 |  C3v  | equlaterial triangle              | W
% |  2 |  C2v  | rectangular plate                 | W, L
% |  3 |  C6v  | hexagon                           | W
% |  4 |  C1   | two dipoles - non symmetric       | W
% |  5 |  C2v  |   n dipoles - in row, symmetric   | W, nObjects
% |  6 |  Dnh  |   n dipoles - circle array        | W, nObjects
% |  7 |  Oh   | cube                              | W, dW
% |  8 |  C4v  | square                            | W
% |  9 |  T    | cube with holes (min nElem = 5)   | W, dW
% | 10 |  Cn   | n L-profiles in circle            | W, nObjects
% | 11 |  C2v  | star - simple structure           | W
% | 12 |  Th   | cube array dipole                 | W, L, dW
% | 13 |  C2v  | rectangular frame                 | W
% | 14 |  C3v  | triangular frame                  | W
% | 15 |  Cnv  | n dipoles in circle               | W, dW, nObjects
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
