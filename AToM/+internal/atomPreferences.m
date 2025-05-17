function preferencesOfAtom = atomPreferences
%% atomPreferences creates structure of AToM preferences
% This static function creates structure of AToM preferences. It is possible to
% modify values by user. 
%
%  OUTPUTS
%   preferencesOfAtom: AToM preferences, struct
%
%  SYNTAX
%
%  preferencesOfAtom = atomPreferences
%
% All variables can be only char or double!
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
% mcode

%% General
general.author = 'AToM author';
general.projectPath = '';
general.tolerance = 1e-10;

%% Debug
debug.sendDebugReport = false; % enables/disables sending of crash reports

%% Workspace
workspace.nSignificantDigitsView = 10;

%% WorkspaceViewer
workspaceViewer.columnWidth = [100 100 60 120 50 50 40];

%% Message
% Message is a singleton, call "clear classes" to apply changes
message.saveStackTo = '';
message.saveLogsTo = '';
message.reducedErrorStack = true;

%% Geom
geom.tolerance = 1e-10;
geom.nPointsOnCurve = 73;

%% Mesh
mesh.tolerance = 1e-10;
mesh.nPointsOnEquationCurve = 500000;
mesh.nPointsOnEllipseArc = 500000;
mesh.meshOnFly = 0;
mesh.meshDensity = 10;
mesh.maxElem = realmax; % maximal size of elements
% mesh.densityFunction = str2func('@(x, y) 1*ones(size(x))'); % default uniform mesh

%% MoM1D
MoM1D.nBatchMax = 50;  % scalar 1..?
MoM1D.quadOrder = 2;  % scalar 1..12
MoM1D.resultRequests = 'zMat, basisFcns';
MoM1D.nWorkers = Inf;  % scalar 0..Inf
MoM1D.verbosity = 2;  % scalar 0..3
MoM1D.wireRadius = 1e-5;

%% MoM2D
MoM2D.nBatchMax = 500;  % scalar 1..?
MoM2D.quadOrder = 1;  % scalar 1..12
MoM2D.resultRequests = 'zMat, mesh, basisFcns';
MoM2D.resultsInRAM = true;  % keep results in RAM
MoM2D.resultsInFile = false;  % save results to file
MoM2D.nWorkers = 0;  % scalar 0..Inf
MoM2D.verbosity = 2;  % scalar 0..3

%% MoM3D
MoM3D.quadOrder = 1;  % scalar 1..12
MoM3D.resultRequests = 'zMat, mesh, basisFcns';
MoM3D.resultsInRAM = true;  % keep results in RAM
MoM3D.resultsInFile = false;  % save results to file
MoM3D.verbosity = 2;  % scalar 0..3

%% GEP
% general
GEP.verbosity = 1;
GEP.showStatusWindow = true; % {logical}
% pre-processing
GEP.delNegValuesOfInputMatrices = false; % {logical}
GEP.symmetrizeInputMatrices = false; % {logical}

% gep
GEP.innerSolver = 'CMs (MoM2D)'; % name of function with inner solver 
% {names of other AToM solvers ('MoM2D' etc.) or 'custom'}
GEP.innerSolverHndl = 'MoM2D';
GEP.innerSolverSolve = '@(objInnerSolver, frequencyList, waitBar) objInnerSolver.solve(frequencyList, waitBar)';
GEP.innerSolverGetA = '@(objInnerSolver) imag(objInnerSolver.results.zMat.data)';
GEP.innerSolverGetB = '@(objInnerSolver) real(objInnerSolver.results.zMat.data)';
GEP.innerSolverGetN = '@(objInnerSolver) NaN';
GEP.matricesStorage = 'ram'; % 'ram' or 'hdd'
GEP.nModes = 10; % number of modes; {double - IRAM (eigs) / 0 - QZ (eig)}
GEP.normConst = 0.5; % {double} norm const C used in 1 = C * I * N * I;
GEP.eigRunPreAndPostprocessing = false;
GEP.eigPreprocessing = '@(data, iFreq, objGEP) myPreprocFcn(data, iFreq, objGEP)';
GEP.eigPostprocessing = '@(eigVec, eigNum, iFreq, objGEP, dataFromPreproc) myPostprocFcn(eigVec, eigNum, iFreq, objGEP, dataFromPreproc)';

% post-processing
GEP.discardNegativeINI = false; % {logical}
GEP.discardComplexLambda = true; % {logical}
GEP.maxMagnEigVal = 1e6; % {double}

% tracking
GEP.corrType = 'II'; % {'II' / 'IRI' / 'FF' / 'custom'}
GEP.corrDataHndl = '@(objGEP) myCorrInputData(objGEP)'; % string in handle
GEP.corrTableHndl = '@(eigVec, corrInputData, gepOptions, corrTable, statusWindow) myCorrTable(eigVec, corrInputData, gepOptions, corrTable, statusWindow)'; % -""-
GEP.minCorrValue = 0.8; % {double}
GEP.minModeLength = 1; %{double / zero for all}
GEP.maxLengthOfGap = 5; % {double / Inf for all}
GEP.charAngleBoundaryTop = 270; % {double / 270 (Inf) for all}
GEP.charAngleBoundaryBottom = 90; % {double / 90 (zero) for all}
GEP.charAngleBoundarySwitch = true; %{logical} - discard modes that switch ...
                                    % between offsides of boundaries
% AFS
GEP.AFSnIterations = 1; % {double}
GEP.AFSnInsertedSamples = 3; % {double}
GEP.AFSinsertedSamplesHandle = '@(f1, f2, n) f1+(1:n) * (1/(n+1)) * (f2 - f1)';
GEP.AFSgoal = ''; % {char}
GEP.AFSregionBoundaryTop = 270; % {double / 270 (Inf) for all}
GEP.AFSregionBoundaryBottom = 90;  % {double / 90 (zero) for all}
GEP.AFSresultsAtGivenSamples = true; % {logical}

%% Make output struct
preferencesOfAtom = struct(...
   'general', general, ...
   'debug', debug, ...
   'workspace', workspace, ...
   'workspaceViewer', workspaceViewer, ...
   'message', message, ...
   'geom', geom, ...
   'mesh', mesh, ...
   'MoM1D', MoM1D, ...      
   'MoM2D', MoM2D, ...   
   'MoM3D', MoM3D, ...
   'GEP', GEP);
