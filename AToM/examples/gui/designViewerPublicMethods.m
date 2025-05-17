%% designViewerPublicMethods shows usage of public methods of DesignViewer.
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

%% Open DesignViewer
atom.gui.designViewer.open;

%% Create geometry and mesh it
% atom.selectedProject.geom.addLine([0 0 1; 1 1 2], 'line1')
%
atom.selectedProject.workspace.addVariable('a', 2);
atom.selectedProject.workspace.addVariable('b', -1);
%
atom.selectedProject.geom.addParallelogram('[0 0 1]', '[-a 0 1]', '[0 -a 1]');
% 
atom.selectedProject.geom.addPolygon('[0 0 1; 0 -b 1; -b -b 1; -b 0 1; 0 0 1]');

atom.selectedProject.physics.feeding.add2DDiscretePort(1, ...
   'baseObjName', 'Parallelogram1', 'positionPar', '[0 0 1; -0.2 -0.2 1]', 'description', '');
%
atom.selectedProject.physics.symmetryPlanes.XY.setType('electric');
%
atom.selectedProject.physics.setFrequencyList('1e8');
atom.selectedProject.mesh.getMesh;
%
%% Change projection to perspective
atom.gui.designViewer.setProjection('perspective');
%% Change projection to orthographic
atom.gui.designViewer.setProjection('orthographic');
%% Show mesh
atom.gui.designViewer.showMesh;
%% Show geometry
atom.gui.designViewer.showGeometry;
%% Change direction of view
atom.gui.designViewer.setViewDirection('front');
atom.gui.designViewer.setViewDirection('back');
atom.gui.designViewer.setViewDirection('top');
atom.gui.designViewer.setViewDirection('bottom');
atom.gui.designViewer.setViewDirection('left');
atom.gui.designViewer.setViewDirection('right');
atom.gui.designViewer.setViewDirection('perspective');
%% Hide coordinate system
atom.gui.designViewer.hideCoordinates;
%% Show coordinate system
atom.gui.designViewer.showCoordinates;
%% Hide origin of coordinate system
atom.gui.designViewer.hideOrigin;
%% Show origin of coordinate system
atom.gui.designViewer.showOrigin;
%% Copy content of designViewer to standalone figure
atom.gui.designViewer.copy;
%% Zoom In
atom.gui.designViewer.zoom;
% or with positive input
atom.gui.designViewer.zoom(1);
%% Zoom out
% with negative input
atom.gui.designViewer.zoom(-1);
%% Fit view
atom.gui.designViewer.fitView;
%% Hide symmetry planes
atom.gui.designViewer.hideSymmetryPlanes;
%% Show symmetry planes
atom.gui.designViewer.showSymmetryPlanes;
%% Hide discrete ports
atom.gui.designViewer.hideDiscretePorts;
%% Show discrete ports
atom.gui.designViewer.showDiscretePorts;
%% Show working plane
atom.gui.designViewer.showWorkingPlane;
%% Hide working plane
atom.gui.designViewer.hideWorkingPlane;
%% Show and hide labels of geometry object
% geometry has to be shown
atom.gui.designViewer.showGeometry;
atom.gui.designViewer.showLabelsOfGeometryObjects;
atom.gui.designViewer.hideLabelsOfGeometryObjects;

%% Show and hide numbers of mesh triangles
% mesh has to be shown
atom.gui.designViewer.showMesh;
atom.gui.designViewer.showNumbersOfMeshTriangles;
atom.gui.designViewer.hideNumbersOfMeshTriangles;
%% Show and hide numbers of mesh edges
% mesh has to be shown
atom.gui.designViewer.showMesh;
atom.gui.designViewer.showNumbersOfMeshEdges;
atom.gui.designViewer.hideNumbersOfMeshEdges;
%% Show and hide numbers of mesh nodes
% mesh has to be shown
atom.gui.designViewer.showMesh;
atom.gui.designViewer.showNumbersOfMeshNodes;
atom.gui.designViewer.hideNumbersOfMeshNodes;
%% Show and hide quality of mesh
atom.gui.designViewer.showMesh;
atom.gui.designViewer.showMeshQuality;
atom.gui.designViewer.hideMeshQuality;
%% Set view
% it is possible to set camera target, camera position and camera view angle in
% degrees
atom.gui.designViewer.showGeometry;
cameraTarget = [0 0 0];
nViews = 100;
for iView = 1:nViews
   cameraPosition = [5*cos(iView*2*pi/nViews), 5*sin(iView*2*pi/nViews), 2];
   atom.gui.designViewer.setView(cameraTarget, cameraPosition, 45);
   drawnow
   pause(0.05)
end

%% Close viewer
atom.gui.designViewer.close;

%% Quit AToM
atom.quit