%% clasiffy modes into irreducible representation at symmetry geometry

%% cleaning
try atom.quit; catch end
clc, clear; close all;

%% example
% |  n | group | shape                             | specifying variables
% -----------------------------------------------------------------------
% |  0 |  C1   | arbitrary shape                   |
% |  1 |  C3v  | equlaterial triangle              | W
% |  2 |  C2v  | rectangular plate                 | W, L
% |  3 |  C6v  | hexagon                           | W
% |  4 |  C1   | two dipoles - non symmetric       | W
% |  5 |  C2v  |   n dipoles - in row, symmetric   | W, nObjects
% |  6 |  Dnh  |   n dipoles - circular array      | W, nObjects
% |  7 |  Oh   | cube                              | W, dW
% |  8 |  C4v  | square                            | W
% |  9 |  T    | cube with holes (min nElem = 5)   | W, dW
% | 10 |  Cn   | n L-profiles in circle            | W, nObjects
% | 11 |  C2v  | star - simple structure           | W, L
% | 12 |  Td   | cube array dipole                 | W, dW
% | 13 |  C2v  | rectangular plate frame           | W
% | 14 |  C3v  | equlaterial triangle frame        | W
% | 15 |  Cnv  |   n dipoles in circle             | W, dW, nObjects
example = 12;

%% structure settings
structureSettings.W = 1;        % width of object
structureSettings.L = 0.5;      % length of object
structureSettings.nObjects = 4; % number of objects
structureSettings.elemPerW = 12; % number of elements per width
structureSettings.dW = 1.2;       % dW * W/2 = distance of cube side from origin

%% constants
ka = 0.5; % electrical size on which is computed impedance matrix

%% mesh and basisFcns
[mesh, symmetryOperations, pointGroup, atom] = ...
   models.utilities.pointGroup.createStructure(example, structureSettings);
basisFcns = models.solvers.MoM2D.basisFcns.getBasisFcns(mesh);
results.plotMesh(mesh);

%% frequency
a = atom.selectedProject.mesh.getCircumsphere;
frequencyList = models.utilities.converter.k0tof0(ka./a{1});
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% transformation matrices
T = models.utilities.pointGroup.transformationMatrices(symmetryOperations);

%% mapping matrices
[C, symmetryOperations, hasSymmetry] = ...
   models.utilities.pointGroup.mappingMatrices(mesh, symmetryOperations);
T = T(:, :, hasSymmetry);

%% multiplication table
[multiTab, classList, classTab] = ...
   models.utilities.pointGroup.multiplicationTable(T);

%% compute operators
atom.selectedProject.solver.MoM2D.setProperties(...
   'quadOrder', 2);
atom.selectedProject.solver.MoM2D.solve;
Z = atom.selectedProject.solver.MoM2D.results.zMat.data;
L = models.utilities.matrixOperators.MoM2D.ohmicLosses.computeL(mesh, basisFcns);

%% compute modes
% compute L - X modes at one frequency
fprintf('eig\n')
[VL, DL] = eig(imag(Z), L);
DL = diag(DL);
% sort by abs of eigen numbers
[~, iD] = sort(abs(DL));
DL = DL(iD);
VL = VL(:, iD);

%% compute irreps and classify modes into them
fprintf('irreps\n')
[modesIrrep, irrepChars, Di] = models.utilities.pointGroup.irreducibleReps(VL, C, 1e-6);
% Di = cellfun(@(d) round(d, 6), Di, 'UniformOutput', false);
%% compute symmetry adapted basis
fprintf('gamma\n')
gamma = models.utilities.pointGroup.symmetryAdaptedBasis(C, Di);
nModesInIrrep = cellfun(@(x) cellfun(@(y) size(y, 2), x), gamma, ...
   'UniformOutput', false);
totalModes = sum(cellfun(@sum, nModesInIrrep))