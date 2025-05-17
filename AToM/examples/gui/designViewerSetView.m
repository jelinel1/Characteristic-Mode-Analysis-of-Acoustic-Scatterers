%% designViewerSetView is script which shows usage of setView method.
% It is necessary to run script with F5 and use breakpoint for pause of
% execution and then use steps F10, Ctrl+Enter, etc.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clear

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% run Minkowski example
pts  = [-50 -30;50 -30;50 30;-50 30];
trns = [1/5 0 0 1/3 0 0; ...
   0.45 0 0 0.45 27.5 17.5; ...
   0.45 0 0 0.45 27.5 -17.5; ...
   0.45 0 0 0.45 -27.5 17.5; ...
   0.45 0 0 0.45 -27.5 -17.5];

IFS = models.utilities.geomPublic.gen_ifs_fractal(pts,trns, 2);
      
for thisPoly = 1:length(IFS)
   p1 = [IFS(1,:,thisPoly) 0];
   p2 = [IFS(2,:,thisPoly) 0];
   p3 = [IFS(4,:,thisPoly) 0];
   atom.selectedProject.geom.addParallelogram(p1, p2, p3);
      if thisPoly > 1
         atom.selectedProject.geom.boolean.unite('Parallelogram1', ...
            ['Parallelogram' num2str(thisPoly)]);
      end
end

%% Open Design Viewer
atom.gui.designViewer.open;
atom.gui.designViewer.setProjection('perspective');

%% Prepare data for movement
N = 200; % number of viaualization steps
r = linspace(10, 120, N).'; % radii of camera position
angle = linspace(pi/4, 33/8*pi, N).'; % angles of camera position
z = linspace(-50, 50, N).'; % z coordinates of camera
cameraPosition = [real(r.*exp(1j*angle)), imag(r.*exp(1j*angle)), z];

for iPos = 1:N
   atom.gui.designViewer.setView([0 0 0], cameraPosition(iPos, :), 45);
   drawnow
   pause(0.05)
end

%%
atom.quit