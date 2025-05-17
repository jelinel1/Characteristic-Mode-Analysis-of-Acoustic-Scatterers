%% Example of GEP with S matrix decomposition
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% mesh
load(fullfile('data','sphere_500tria.mat'));
p = mesh.p';
t = mesh.t(1:3,:)';
atom.selectedProject.mesh.import2DMesh(p, t, 'sphere');
clear mesh p t;

%% Physics
ka = 1/2;
a = atom.selectedProject.mesh.getCircumsphere;
frequencyList = models.utilities.converter.k0tof0(ka/a{1});
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% standard GEP
% handle to inner solver
nModes = 500;
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'corrType', 'II',...
   'nModes', nModes,...
   'maxMagnEigVal', Inf,...
   'AFSresultsAtGivenSamples', true,...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

atom.selectedProject.solver.GEP.solve();
eigNumXR = sort(abs(atom.selectedProject.solver.GEP.results.eigNum.unsorted.data));

%% S Matrix
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D + Smatrix)');

atom.selectedProject.solver.GEP.solve();
eigNumXS = sort(abs(atom.selectedProject.solver.GEP.results.eigNum.unsorted.data));

%% analytical data
TE = [...
     2.749638840626264e+01, 1.530740922095199e+03, 2.096444772679131e+05,...
     5.231352405050048e+07, 2.059722768790113e+10, 1.173666214803997e+13,...
     9.129584947135038e+15, 9.293014170690050e+18, 1.198726859501525e+22,...
     1.910695916507358e+25, 3.687545197011407e+28, 8.473820645608657e+31,...
     2.286205918817072e+35, 7.155752824271902e+38, 2.571758050480231e+42,...
     1.051842887525850e+46, 4.857388182010910e+49, 2.515146435633559e+53,...
     1.451235237792481e+57, 9.279175966212976e+60];
TM = [...
    -1.133395081414775e+01, -9.867896978136499e+02, -1.556488545179709e+05,...
    -4.166412827793028e+07, -1.712356992583433e+10, -1.004573512942239e+13,...
    -7.981084661473725e+15, -8.255302351041013e+18, -1.078374051491288e+22,...
    -1.736425576378607e+25, -3.379406405341545e+28, -7.820471398325473e+31,...
    -2.122579151655893e+35, -6.677875000486013e+38, -2.410778798509142e+42,...
    -9.898866600386245e+45, -4.587210652198463e+49, -2.382628540413350e+53,...
    -1.378603464591502e+57, -8.836924344032907e+60];
eigNumA = double.empty;
for iter = 1:20
   n = 2*iter + 1;
   eigNumA = [eigNumA, repmat(TE(iter), 1, n) repmat(TM(iter), 1, n)];
end
eigNumA = sort(abs(eigNumA));

%% Visualization
shiftXR = find(eigNumXR > 0, 1, 'first');
shiftXS = find(eigNumXS > 0, 1, 'first');
shiftA = find(eigNumA > 0, 1, 'first');
f = figure;
ax = axes(f);
lineStyle = {'LineStyle', '--', 'Marker', 'x'};
plot(ax, (1:nModes)-shiftXR, abs(eigNumXR), lineStyle{:})
hold on
grid on
plot(ax, (1:nModes)-shiftXS, abs(eigNumXS), lineStyle{:})
plot(ax, (1:length(eigNumA))-shiftA, abs(eigNumA), lineStyle{:})
ax.YScale = 'log';
ax.YLim = [1e-2, 1e45];
ax.XLim = [0, 400];
title('sort(abs(eigNum))')
xlabel('nMode')
ylabel('|\lambda(n)|')
legend('GEP: X - R Decomposition', 'GEP: X - S Decomposition', 'Exact results', 'Location', 'northwest');

%% Quit the session
atom.exit