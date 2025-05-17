%% Test singularity treatment in AToM MoM2D
% This script create three RWG basis functions. One is centered in x-y plane.
% Second is in co-planar configuration with respect to the first one, being
% shifted by distance dL. The third is in parallel-plate configuration with
% respect to the first, , being shifted by distance dL. Static electric and
% magnetic parts of impedance matrix are calculated. The convergence of possibly
% singular reaction integral is shown.
% 9.9.2019

%% Terminate AToM and delete previously created project
try atom.quit; end
try delete('Ex1_SingularityTreatment.atom'); end

%% Arrange Workspace
clear
close all;

%% Initialize AToM AToM, create project
atom = Atom.start(false);
atom.createProject('Ex1_SingularityTreatment');

%% Example setup
NL = 50; % number of points for basis function shift
nQuadVec = 1:1:12; % quandrature order
Nq = size(nQuadVec,2);

%% initialilation of variables

zE0Self = nan(Nq,NL); % static self-term (charge)
zM0Self = nan(Nq,NL); % static self-term (current)

zE0par = nan(Nq,NL); % parallel-plate cross-term (charge)
zM0par = nan(Nq,NL); % parallel-plate cross-term (current)

zE0cop = nan(Nq,NL); % co-planar cross-term (charge)
zM0cop = nan(Nq,NL); % co-planar cross-term (current)

fwait = waitbar(0,'Evaluation'); % waitbar

%% mesh initialilation

dx = 1; % mesh size along x
dy = 0.3; % mesh size along y
ABF = dx*dy/2; % surface of one basis function
dLvec = 10.^linspace(-3,1,NL)*sqrt(ABF); % shift of basis functions

% basis function at origin (lying in x-y plane)
p = [[-dx/2, -dy/2, 0]; [dx/2, -dy/2, 0]; [dx/2, dy/2, 0]; [-dx/2, dy/2, 0]];
t = [[1, 2, 4]; [3, 4, 2]];
atom.selectedProject.mesh.import2DMesh(p, t, 'TestMesh');

%% evaluation

for iq = 1:Nq
   nQuad = nQuadVec(1, iq);
   for il = 1:NL
      atom.selectedProject.mesh.deleteMesh('TestMesh')
      dL = dLvec(1, il);
      
      % basis function at origin (lying in x-y plane)
      p=[[-dx/2, -dy/2, 0]; [dx/2, -dy/2, 0]; [dx/2, dy/2, 0]; ...
         [-dx/2, dy/2, 0]];
      t=[[1, 2, 4]; [3, 4, 2]];
      
      % basis function shifted by dL along z-axis (parallel-plate configuration)
      p=[p; [-dx/2, -dy/2, dL]; [dx/2, -dy/2, dL]; ...
         [dx/2, dy/2, dL]; [-dx/2, dy/2, dL]];
      t=[t; [5, 6, 8];[7, 8, 6]];
      
      % basis function shifted by dL along x-axis (co-planar configuration)
      p=[p; [dx/2 + dL, -dy/2, 0]; [3*dx/2 + dL, -dy/2, 0]; ...
         [3*dx/2 + dL, dy/2, 0];[dx/2 + dL, dy/2, 0]];
      t=[t; [9, 10, 12]; [11, 12, 10]];
      
      atom.selectedProject.mesh.import2DMesh(p, t, 'TestMesh');
      % atom.selectedProject.mesh.plotMesh; % uncomment this to see mesh
      clear('p','t')
       
      %% solver settings and solution
      % particular value of frequency is not relevant
      atom.selectedProject.physics.setFrequencyList(1);
      
      % request for static electric and magnetic matrix, see documentation
      atom.selectedProject.solver.MoM2D.setProperties('resultRequests', ...
         'basisFcns, zMatE0, zMatM0');
      
      atom.selectedProject.solver.MoM2D.setProperties('quadOrder', nQuad, ...
         'nBatchMax', 5000,'verbosity',0);
      atom.selectedProject.solver.MoM2D.solve();
      
      % Get static electric and magnetic matrix and normalize them with respect
      % to the smallest circumscribing sphere
      ZE0 = atom.selectedProject.solver.MoM2D.results.zMatE0.data;
      ZM0 = atom.selectedProject.solver.MoM2D.results.zMatM0.data;
      
      Mesh = atom.selectedProject.mesh.getMeshData2D;
      a = Mesh.normDistanceA; % radius of the smallest circumscribing sphere
      
      % normalize static electric and static magnetic matrix
      ZE0 = ZE0 * a;
      ZM0 = ZM0 * a^3;
      
      % These are self-terms.
      zE0Self(iq,il) = ZE0(1,1);
      zM0Self(iq,il) = ZM0(1,1);
      
      % These are terms corresponding to parallel-plate configuration
      zE0par(iq,il) = ZE0(1,2);
      zM0par(iq,il) = ZM0(1,2);
      
      % These are terms corresponding to co-planar configuration
      zE0cop(iq,il) = ZE0(1,3);
      zM0cop(iq,il) = ZM0(1,3);
      
      % update waitbar
      waitbar(((iq-1)*NL+il)/(NL*Nq));
      
   end
end
close(fwait);

%% plot static electric results
iq = [1, 2, 4, 8, 12]; % depicted quadrature orders
stringOptions = {'Interpreter', 'latex', 'FontSize', 12};
myLegend = cellfun(@(n) sprintf('nQuad = %1.0f', n), ...
   num2cell(iq), 'uni', false);

figure('color', 'w');
plot(nQuadVec.', zE0Self(:,1), '-x')
grid on;
xlabel('quadrature order $\left[ - \right]$', stringOptions{:});
ylabel('$a Z_{1,1}^{\mathrm{E0}} $ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1]);
title('Static electric self-term');

figure('color', 'w');
loglog(dLvec/sqrt(ABF), zE0par(iq,:), '-');
hold on;
set(gca, 'ColorOrderIndex', 1);
loglog(dLvec/sqrt(ABF), zE0Self(iq,:), '--');
grid on;
xlabel('$dL / \sqrt{A}$ $\left[ - \right]$', stringOptions{:});
ylabel('$a Z_{1,2}^{\mathrm{E0}} $ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1]);
title('Static electric self-term and parallel-plate term');
legend([myLegend, myLegend], 'Location', 'southwest');

figure('color', 'w');
loglog(dLvec/sqrt(ABF),-zE0cop(iq,:), '-');
grid on
xlabel('$dL / \sqrt{A}$ $\left[ - \right]$', stringOptions{:});
ylabel('$- a Z_{1,3}^{\mathrm{E0}}$ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1])
title('Static electric co-planar term');
legend(myLegend);

%% plot static magnetic results results
figure('color', 'w');
plot(nQuadVec.', zM0Self(:,1), '-x')
grid on;
xlabel('quadrature order $\left[ - \right]$', stringOptions{:});
ylabel('$a^3 Z_{1,1}^{\mathrm{M0}}$ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1]);
title('Static magnetic self-term');

figure('color', 'w');
loglog(dLvec/sqrt(ABF), zM0par(iq,:), '-');
hold on;
set(gca, 'ColorOrderIndex', 1);
loglog(dLvec/sqrt(ABF), zM0Self(iq,:), '--');
grid on;
xlabel('$dL / \sqrt{A}$ $\left[ - \right]$', stringOptions{:});
ylabel('$a^3 Z_{1,2}^{\mathrm{M0}}$ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1]);
title('Static magnetic self-term and parallel-plate term');
legend([myLegend, myLegend], 'Location', 'southwest');

figure('color', 'w');
loglog(dLvec/sqrt(ABF), zM0cop(iq,:), '-');
grid on;
xlabel('$dL / \sqrt{A}$ $\left[ - \right]$', stringOptions{:});
ylabel('$a^3 Z_{1,3}^{\mathrm{M0}}$ $\left[ - \right]$', stringOptions{:});
pbaspect([3 2 1]);
title('Static magnetic co-planar term');
legend(myLegend);

fprintf(2, 'Notice that AToM package is still running. Quit it by \n >> atom.quit; \n');

%% exit session
atom.exit