%% Create a strip dipole and mesh
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
nMeandres = 3;
atom.selectedProject.workspace.addVariable('L', 1, 'length')
atom.selectedProject.workspace.addVariable('w', 'L/20', 'microtrip width')

%% create Objects
cellPoints = cell(1, 4*nMeandres + 3);

% base line
cellPoints{1} = '-L/2, 0, 0; L/2, 0, 0; ';
% most rightUp
cellPoints{2 + nMeandres} = ['L/2, (4*', num2str(nMeandres), '+1)*w, 0; '];
% most leftUp
cellPoints{3 + 3*nMeandres} = ['-L/2, (4*', num2str(nMeandres), '+1)*w, 0; '];
for iM = 1:nMeandres
   iR = nMeandres - iM;
   % rightUp
   cellPoints{1+iM} = sprintf(['L/2, (4*%d-1)*w, 0; ', ...
      '3*w/2, (4*%d-1)*w, 0; ', ...
      '3*w/2, 4*%d*w, 0; ', ...
      'L/2, 4*%d*w, 0; '], iM, iM, iM, iM);
   % rightDown
   cellPoints{2+nMeandres+iM} = sprintf(['w/2, (4*%d+5)*w, 0; ', ...
      'w/2, (4*%d+2)*w, 0; ', ...
      'L/2-w, (4*%d+2)*w, 0; ', ...
      'L/2-w, (4*%d+1)*w, 0; '], iR, iR, iR, iR);
   % leftUp
   cellPoints{2+2*nMeandres+iM} = sprintf(['-L/2+w, (4*%d-3)*w, 0; ', ...
      '-L/2+w, (4*%d-2)*w, 0; ', ...
      '-w/2, (4*%d-2)*w, 0; ', ...
      '-w/2, (4*%d+1)*w, 0; '], iM, iM, iM, iM);
   % leftDown
   
   cellPoints{3+3*nMeandres+iM} = sprintf(['-L/2, (4*%d+4)*w, 0; ', ...
      '-3*w/2, (4*%d+4)*w, 0; ', ...
      '-3*w/2, (4*%d+3)*w, 0; ', ...
      '-L/2, (4*%d+3)*w, 0; '], iR, iR, iR, iR);
end
points = ['[', cell2mat(cellPoints), ']'];

atom.selectedProject.geom.addPolygon(points, 'mendredDipole');
% atom.selectedProject.geom.addPolygon(...
%    [2 -5 0; 4 -5 0; 4 -2 0; 2 -2 0; 2 -5 0]);
% atom.selectedProject.geom.addLine([-1 -1 0; 2 -2 0]);
fig = atom.selectedProject.geom.plot;

%% save project
atom.selectedProject.save;

%% end session
atom.quit