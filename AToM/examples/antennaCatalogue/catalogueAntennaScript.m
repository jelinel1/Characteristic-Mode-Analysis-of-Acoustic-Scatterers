fileName = 'geom_work';
if exist('atom', 'var')
   atom.quit;
end
if exist('geom_work.atom', 'file')
   delete([fileName, '.atom']);
end


%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);


antennaGUI = models.antennaCatalogue.AntennaGUI(atom.selectedProject);
antennaGUI.open;

atom.gui.designViewer.open

%   atom.selectedProject.workspace.addVariable('length',20, 'length')
%   atom.selectedProject.workspace.addVariable('width', 'length/20','width')
% atom.selectedProject.workspace.addVariable('stages',5, 'stages');
%  atom.selectedProject.workspace.addVariable('radius', 6, 'radius');
 
% atom.selectedProject.workspace.addVariable('c', [0 0 0], 'center1');
% atom.selectedProject.workspace.addVariable('a', 1, 'major radius');
% atom.selectedProject.workspace.addVariable('b', '2*a/3', 'minor radius');

% mygui(atom.selectedProject.antennaCatalogue)

%% 1D 
%% dipole( obj, length, width )
%    dipole(atom.selectedProject.antennaCatalogue, 2);
%% twoDipoles( obj, length, distance )
%   twoDipoles(atom.selectedProject.antennaCatalogue, 2, 0.5);



%% loop(obj, radius)
% loop(atom.selectedProject.antennaCatalogue, 2)
%% monopole(obj,length, width, N )
%  monopole(atom.selectedProject.antennaCatalogue,2, 1,8 )
%% sphericalCapLoadedDipole(obj, radius, angle)
%   sphericalCapLoadedDipole(atom.selectedProject.antennaCatalogue, 3,30/360*2*pi)
%% spiral(obj,,amplitude, interval)
%   spiral(atom.selectedProject.antennaCatalogue,5, [0 12*pi])
%% yagiUda(obj, length, length2, length3, distance12, distance23,distance3N, numberD)
%     yagiUda(atom.selectedProject.antennaCatalogue,0.8,0.5,0.4,0.2,0.15,0.5,4)

%% 2D 
%% meanderAntenna(obj, length, width, stages)
%      meanderAntenna(atom.selectedProject.antennaCatalogue,10, 3, 2);
%% chiralSplitRingResonator( obj, rout, rin, height, d)
%      chiralSplitRingResonator(atom.selectedProject.antennaCatalogue, 1,4/5,0.5,0.1);
%% chiralSplitRingResonator( obj, rout, rin, height, distance)
% chiralSplitRingResonator(atom.selectedProject.antennaCatalogue, 1,4/5,0.5,0.1);
%% circularLoop( obj, center, radius, width)
%     circularLoop(atom.selectedProject.antennaCatalogue, '[0, 0, 0]',1,0.2);
%% circularMicrostrip( obj, radius, length, width, width2, depth)
%    circularMicrostrip(atom.selectedProject.antennaCatalogue, 3,9,1,0.5,1);
%% vivaldiMicrostrip(obj, length, length2, width, width2, width3, radius)
%  vivaldiMicrostrip(atom.selectedProject.antennaCatalogue,...
%      1,0.8, 0.5, 0.4, 0.01, 0.05);
%% linearTaperedSlot( obj, length,length2, width, width2, width3, radius)
%   linearTaperedSlot(atom.selectedProject.antennaCatalogue, 1, 0.8, 0.5, 0.4, 0.0001, 0.05);
%% foldedDipole( obj, length, width, widthStrip)
%      foldedDipole(atom.selectedProject.antennaCatalogue, 3, 1, 0.1)
%% franklinAntenna(obj, length, length2, width, width2, nBend)
%    franklinAntenna(atom.selectedProject.antennaCatalogue, 2, 0.18, 0.1,0.6,4)
%% rectangle(obj, length,  width) 
%   rectangle(atom.selectedProject.antennaCatalogue, 2, 1)
%% squareLoop( obj, length, width )
%    squareLoop(atom.selectedProject.antennaCatalogue, 3, 0.2 )
%% ellipse(obj, cP, majV, minV, sA, a)
%     ellipse(atom.selectedProject.antennaCatalogue, '[0 0 0]',...
%      '[1, 0, 0]', '[0, 2/3, 0]', 0, '270/360*2*pi')
%% bowtie(obj, length, widthO, widthI)
%      bowtie(atom.selectedProject.antennaCatalogue, 5,3,0.2)
%% bowtieR(obj, length, widthO, widthI, arc)
%      bowtieR(atom.selectedProject.antennaCatalogue, -5,-3,-0.2,-0.2)
%% patchAntennaWithLprobe(obj, length, length2, length3, width, width2, width3, height, height2)
%      patchAntennaWithLprobe(atom.selectedProject.antennaCatalogue, 2,1,0.5,2,1,0.3,1,0.5)
%% patchWithUslot(obj, lengthP, widthP, lengthS, widthS, space)
%     patchWithUslot(atom.selectedProject.antennaCatalogue, 2,4/3,0.75,4/6,1/5)
%% egyptianAxeDipole(obj, radius, width, angle)
%     egyptianAxeDipole(atom.selectedProject.antennaCatalogue, 1,1/20,40/360*2*pi)
%% circularlyBendedDipole(obj, center, radius, width, angle)
%     circularlyBendedDipole(atom.selectedProject.antennaCatalogue,'[0,0,0]', 1,1/20,40/360*2*pi)
%% unotchedLoop(obj, center, radius, width1, width2)
%       unotchedLoop(atom.selectedProject.antennaCatalogue,'[0,0,0]', 1,1/20, 1/5)
%% splitRingResonator(obj, radius, width1,width2, angle )
%   splitRingResonator(atom.selectedProject.antennaCatalogue,'[0,0,0]', 2, 0.4,0.3, 5/360*2*pi )
%% splitRingResonator2(obj, radius, width1,width2, angle, nRings )
%    splitRingResonator2(atom.selectedProject.antennaCatalogue,'[0,0,0]', 2, 0.1,0.5, 5/360*2*pi,5)
%% generateHelix(obj, amin, amax, M, h, N, S)
% generateHelix(atom.selectedProject.antennaCatalogue,0.1, 0.2, 30, 0.005, 10, 0.01)

% 
%     atom.gui.designViewer.open
%   fig = atom.selectedProject.geom.plot;


%% save project
atom.selectedProject.save;


%% end session
%     atom.quit