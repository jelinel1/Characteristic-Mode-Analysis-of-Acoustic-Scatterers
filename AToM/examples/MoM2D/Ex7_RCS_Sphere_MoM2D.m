%% Ex7_RCS_Sphere_MoM2D - evaluates radar cross-section of a sphere
% This example shows an evaluation of radar cross-section of a conducting 
% sphere. Very small penetration depth is assumed.
%
% Package SphericalWaves is required.
% Included in AToM, info@antennatoolbox.com
% (c) 2021, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com

clear;
close all;
clc;

%% Create and plot mesh

% Lebedev sampling
% N could be 6, 14, 26, 38, 50, 74, 86, 110, 146, 170, 194, 230, 266, 
% 302, 350, 434, 590, 770, 974, 1202, 1454, 1730, 2030, 2354, 2702, ...
N = 110;
r = models.utilities.thirdParty.getLebedevSphere(N);
DT = delaunayTriangulation(r(:,1),r(:,2),r(:,3));

% get nodes, connectivityList
nodes = DT.Points;
connectivityList = DT.convexHull;

% scale mesh
nodes = nodes*1e-6;

% create mesh structure
mesh = models.utilities.meshPublic.getMeshData2D(nodes, connectivityList);

% create basis function structure
basisFunc = models.solvers.MoM2D.basisFcns.getBasisFcns(mesh);

% plot mesh
options.showEdges = true;
options.showTriangles = true;
hndlMesh = results.plotMesh(mesh, 'options', options);
hndlMesh.triangles.FaceColor = 'flat';
hndlMesh.triangles.FaceVertexCData = repmat([255,255,153]/255, ...
    [mesh.nTriangles,1]);
view(-36,33);

% triange opacity
hndlMesh.triangles.FaceAlpha = 0.8;

%% Set frequency range and initialize variables

Nka = 100; % number of frequency points
kaList = 2*pi*10.^linspace(-2, log10(3), Nka); % electric size

fList = nan(1,Nka); % frequency
ZsList = nan(1,Nka); % surface resistance
RCSList = nan(1,Nka); % calculated RCS
sigmaScattList = nan(1,Nka); % calculated scattering cross-section
sigmaExtList = nan(1,Nka); % calculated extinction cross-section
sigmaAbsList = nan(1,Nka); % calculated absorption cross-section

QrcsListMiePEC = nan(1,Nka);  % normalized RCS (Mie series, PEC)
QsListMiePEC = nan(1,Nka); % normalized scattering cross-section (Mie series, PEC)
QrcsListMie = nan(1,Nka);  % normalized RCS (Mie series)
QsListMie = nan(1,Nka); % normalized scattering cross-section (Mie series)
QeListMie = nan(1,Nka); % normalized extinction cross-section (Mie series)
QaListMie = nan(1,Nka);  % normalized absorption cross-section (Mie series)

% set material properties
sigmaList = repmat(1e6/0.018, [1, Nka]);
eprList = nan(1,Nka); % permittivity
penDepthList = nan(1,Nka); % penetration depth

%% Excitation
% planewave
planeWaveData.propagationVector = [0 0 1];
planeWaveData.initElectricField = [1 0 0];
planeWaveData.axialRatio = Inf;
planeWaveData.direction = 'right';

%% Solver settings
MoMVerosity = 0;
normalize = true; % true / false  - normalization of MoM quantities
quadOrder = 5;

%% Solve MoM
for ika = 1:Nka
    ka = kaList(1,ika);
    k0 = ka/mesh.normDistanceA;
    lambda0 = 2*pi/k0;
    f0 = models.utilities.constants.c0/lambda0;
    fList(1,ika) = f0;
    eprList(1,ika) = 1 - 1i*sigmaList(1,ika)/...
        (2*pi*f0*models.utilities.constants.ep0);
    penDepthList(1,ika) = - 1/imag(k0*sqrt(eprList(1,ika)));
    
    % surface impedance
    ZsList(1,ika) = 1/(sigmaList(1,ika)*penDepthList(1,ika)); 
    
    [OP, ~] = models.utilities.matrixOperators.MoM2D.batch.evaluate(mesh, f0,...
        ZsList(1,ika), 'quadOrder', quadOrder, 'verbosity', MoMVerosity,...
        'normalize', normalize, 'symmetrize', false, 'usegpu', true, ...
        'requests', {'R0','Rmat', 'X0','Xmat','U'});
    
   % define radiation intensity direction, component and frequency
   % direction and polarization of the planewave is set on line 65-68
   OP.theta = pi;
   OP.phi = 0;
   OP.component = 'total';
   OP.f0 = f0;

    % planewave
    V = models.solvers.MoM2D.excitation.planeWave(mesh, basisFunc, ...
        planeWaveData, k0, quadOrder);

    if normalize
        %  normalized --> V [Volt]
        V = V./mesh.triangleEdgeLengths(OP.BF.data(:,3),1);
    end
    
    % current induced on the sphere
    I = mldivide(OP.R0 + OP.Rmat + 1i*OP.X0 + 1i*OP.Xmat, V);
    
    % evaluate RCS
    RCSList(1, ika) = models.utilities.constants.Z0*8*pi* ...
        I'*OP.U_hndl(OP.f0, OP.theta, OP.phi, ...
      OP.component)*I/(norm(planeWaveData.initElectricField)^2);
  
    % evaluate cross sections
    sigmaScattList(1, ika) = models.utilities.constants.Z0* ...
        real(I'*OP.R0*I) / (norm(planeWaveData.initElectricField)^2);
    sigmaAbsList(1, ika) = models.utilities.constants.Z0* ...
        real(I'*OP.Rmat*I) / (norm(planeWaveData.initElectricField)^2);
    sigmaExtList(1, ika) = sigmaScattList(1, ika) + ...
        sigmaAbsList(1, ika);
    
    if normalize
        % remove normalization --> I[A/m]
        I = I./mesh.triangleEdgeLengths(basisFunc.data(:,3),1);
    end
    
    %% Mie series reuslts
    
    lMax = models.utilities.matrixOperators.MoM2D.SMatrix.lmax(...
        k0, [mesh.normDistanceA, 0, 0]);
    
    [OP.T, ~] = multilayerSphere.computeMaterialSphere( ...
    fList(1, ika), mesh.normDistanceA, lMax, eprList(1, ika), 1, 0, 1, 1, 0);
    
    indexVec = ones(size(OP.T,1), 1);
    [QsListMie(1, ika), QaListMie(1, ika), QeListMie(1, ika), ...
        QrcsListMie(1, ika)] = utilities.computeCrossSections( ...
        planeWaveData, OP.T, indexVec, kaList(1, ika), OP.theta, OP.phi);
    
    [OP.T, ~] = multilayerSphere.computePECsphere(fList(1, ika), ...
        mesh.normDistanceA, lMax);
    
    [QsListMiePEC(1, ika), ~, ~, ...
        QrcsListMiePEC(1, ika)] = utilities.computeCrossSections( ...
        planeWaveData, OP.T, indexVec, kaList(1, ika), OP.theta, OP.phi);
    
    %%
    disp(num2str(Nka - ika))
end

%% Asymptotic results according to Bohren and Huffman (5.8), ka << 1

x = kaList;
m = sqrt(eprList);

QsListMieApprox = 8/3*(x.^4).*abs((m.^2 - 1)./(m.^2 + 2)).^2;

QsListMiePECApprox = 8/3*(x.^4) + 2/3*(x.^4);

%% Plot current
h = results.plotCurrent(mesh, 'basisFcns', basisFunc, 'Ivec', I, ...
    'part', 'abs', 'scale', 'logarithmic', 'arrowScale', 'proportional');
view(-36,33);

%% Plot radiation pattern
theta = linspace(0, pi, 60);
phi = linspace(0, 2*pi, 120);

farfield = results.calculateFarField(mesh, f0, 'theta', theta, ...
    'phi', phi, 'basisFcns', basisFunc, 'iVec', I);

handleFF = results.plotFarField('farField', abs(farfield.D), ...
    'theta', theta, 'phi', phi);
view(-36,33);
handleFF.type = 'farField';

%% Plot results
figure
loglog(kaList/(2*pi), RCSList/(pi*mesh.normDistanceA^2))
hold on
loglog(kaList/(2*pi), QrcsListMie)
hold on
loglog(kaList/(2*pi), QrcsListMiePEC)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \mathrm{RCS} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie','Mie PEC')

figure
loglog(kaList/(2*pi), sigmaScattList/(pi*mesh.normDistanceA^2))
hold on
loglog(kaList/(2*pi), QsListMie)
hold on
loglog(kaList/(2*pi), QsListMiePEC)
hold on
loglog(kaList/(2*pi), QsListMieApprox)
hold on
loglog(kaList/(2*pi), QsListMiePECApprox)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{s} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie','Mie PEC','Approx.','Approx. PEC')

figure
loglog(kaList/(2*pi), sigmaAbsList/(pi*mesh.normDistanceA^2))
hold on
loglog(kaList/(2*pi), QaListMie)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{a} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie')

figure
loglog(kaList/(2*pi), sigmaExtList/(pi*mesh.normDistanceA^2))
hold on
loglog(kaList/(2*pi), QeListMie)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{e} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie')

figure
loglog(kaList/(2*pi), penDepthList/mesh.normDistanceA)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \delta / a$','Interpreter', 'latex','FontSize', 16)