%% Ex1_RCS_Sphere_MoM3D - evaluates radar cross-section of a sphere
% This example shows an evaluation of radar cross-section of a dielectric
% sphere
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com

clear;
close all;
clc;


%% Create mesh

fileName = 'sphere_nTetra_961.nas';

[nodes, ~, ~, connectivityList, fileIsReadable] = ...
    models.utilities.meshPublic.importNastran([pwd '\examples\MoM3D\data\mesh\sphere_nTetra_961.nas']);

% scale mesh
nodes = nodes * 30e-9;

% create mesh structure
mesh = models.utilities.meshPublic.getMeshData3D(...
    nodes, connectivityList, ones(size(connectivityList,1), ...
    1, 'uint32'), 1e-9);

% create basis function structure
basisFunc   = models.solvers.MoM3D.basisFcns.getBasisFcns(mesh);

%% Set frequency range and initialize variables

Nka = 100; % number of frequency points
kaList = 2*pi*10.^linspace(-2, log10(3), Nka); % electric size
[a, ~] = models.utilities.meshPublic.getCircumsphere(nodes); % circum. sphere
k0List = kaList/a; % wavenumber
lambda0List = 2*pi./k0List; % wavelength
fList = models.utilities.constants.c0./lambda0List; % frequency

RCSList = nan(1,Nka); % calculated RCS
sigmaScattList = nan(1,Nka); % calculated scattering cross-section
sigmaExtList = nan(1,Nka); % calculated extinction cross-section
sigmaAbsList = nan(1,Nka); % calculated absorption cross-section
PradList = nan(1,Nka); % calculated radiated power
PlostList = nan(1,Nka); % calculated radiated power

QrcsListMie = nan(1,Nka);  % normalized RCS (Mie series)
QsListMie = nan(1,Nka); % normalized scattering cross-section (Mie series)
QeListMie = nan(1,Nka); % normalized extinction cross-section (Mie series)
QaListMie = nan(1,Nka);  % normalized absorption cross-section (Mie series)

% set material properties
% conjugate is needed as LD is using different time convetion
epr = conj(models.utilities.thirdParty.LD(lambda0List, 'Au', 'LD'));
% epr = repmat(3*(1 - 1i*1e-1), [1, Nka]);

% check electric size of mesh
meshElSizeRe = nan(1, Nka);
meshElSizeIm = nan(1, Nka);
worstTetRe = nan(1, Nka);
worstTetIm = nan(1, Nka);

%% Excitation
% planewave
planeWaveData.propagationVector = [0 0 1];
planeWaveData.initElectricField = [1 0 0];
planeWaveData.axialRatio = Inf;
planeWaveData.direction = 'right';

%% Solver settings
MoMVerosity = 0;
quadOrder = 5;
waitBar = []; % empty report waitbar

%% precalculation of static integrals
GintStatic = ...
    models.solvers.singularities.tetraPWC.triaTriaStaticGreen(quadOrder, ...
    mesh.nodes(mesh.triangleConnectivity(:,1),:), ...
    mesh.nodes(mesh.triangleConnectivity(:,2),:), ...
    mesh.nodes(mesh.triangleConnectivity(:,3),:), ...
    mesh.triangleAreas, waitBar, MoMVerosity);

%% Solve MoM
for ika = 1:Nka
    
    materialStr = models.materialsMoM3D.initMaterial(mesh);
    materialStr.AssignmentMode = 'piecewise';
    materialStr.ScalarTensor = 'scalar';
    materialStr.PiecewiseAssignment(1,1) = 1;
    materialStr.PiecewiseAssignment(1,2:7) = [1,0,0,1,0,1]*epr(1, ika);
    materialStr = models.materialsMoM3D.assignMaterial(materialStr, mesh);
    
    % check electric size of mesh
    [meshElSizeRe(1, ika), meshElSizeIm(1, ika), ...
       worstTetRe(1, ika),   worstTetIm(1, ika)] = ...
       models.utilities.meshPublic.getElectricalSize(...
       fList(1, ika), mesh, materialStr);
    
    % evaluate matrices
    OP.Z0 = models.solvers.MoM3D.equations.zMatVac(mesh, basisFunc, ...
        k0List(1, ika), quadOrder, waitBar, MoMVerosity, GintStatic);
    OP.Zmat = models.solvers.MoM3D.equations.zMatRho(mesh, basisFunc, ...
        k0List(1, ika), materialStr);
    
   % define radiation intensity direction, component and frequency
   OP.theta = pi;
   OP.phi = 0;
   OP.component = 'total';

   [OP.U, ~, ~] = ...
        farField.computeU(mesh, basisFunc, k0List(1, ika), ...
        OP.theta, OP.phi, OP.component, quadOrder);
    
    % planewave
    V = models.solvers.MoM3D.excitation.planeWave(mesh, basisFunc, ...
        planeWaveData, k0List(1, ika), quadOrder);
    
    % current induced on the sphere
    I = mldivide(OP.Z0 + OP.Zmat, V);

    % evaluate radiated and lost power
    PradList(1, ika) = real(0.5*I'*OP.Z0*I);
    PlostList(1, ika) = real(0.5*I'*OP.Zmat*I);

    % evaluate RCS
    RCSList(1, ika) = models.utilities.constants.Z0*8*pi* ...
        real(I'*OP.U*I)/(norm(planeWaveData.initElectricField)^2);
    
    % evaluate total cross sections
    sigmaScattList(1, ika) = models.utilities.constants.Z0* ...
        2*PradList(1, ika) / (norm(planeWaveData.initElectricField)^2);
    sigmaAbsList(1, ika) = models.utilities.constants.Z0* ...
        2*PlostList(1, ika) / (norm(planeWaveData.initElectricField)^2);
    sigmaExtList(1, ika) = sigmaScattList(1, ika) + sigmaAbsList(1, ika);
    
    %% Mie series reuslts
    
    lMax = models.utilities.matrixOperators.MoM2D.SMatrix.lmax(...
        k0List(1, ika), [a, 0, 0]);
    
    [OP.T, ~] = multilayerSphere.computeMaterialSphere( ...
    fList(1, ika), a, lMax, epr(1, ika), 1, 0, 1, 1, 0);
    
    indexVec = ones(size(OP.T,1), 1);
    [QsListMie(1, ika), QaListMie(1, ika), QeListMie(1, ika), ...
        QrcsListMie(1, ika)] = utilities.computeCrossSections( ...
        planeWaveData, OP.T, indexVec, kaList(1, ika), OP.theta, OP.phi);
    
    %%
    disp(num2str(Nka - ika))
end

%% Asymptotic results according to Bohren and Huffman (5.8), ka << 1

x = kaList;
m = sqrt(epr);

QeListMieApprox = - 4*x.*imag(...
    (m.^2 - 1)./(m.^2 + 2).*(...
    1 + x.^2/15.*(m.^2 - 1)./(m.^2 + 2).*(m.^4 + 27*m.^2 + 38)./ ...
    (2*m.^2 + 3))) + ...
    8/3*(x.^4).*real((m.^2 - 1)./(m.^2 + 2)).^2;

QsListMieApprox = 8/3*(x.^4).*abs((m.^2 - 1)./(m.^2 + 2)).^2;

QaListMieApprox = QeListMieApprox - QsListMieApprox;

%% Plot results
figure
loglog(kaList/(2*pi), RCSList/(pi*(mesh.circumRadius*mesh.normDistance)^2))
hold on
loglog(kaList/(2*pi), QrcsListMie)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \mathrm{RCS} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie')

figure
loglog(kaList/(2*pi), sigmaScattList/...
    (pi*(mesh.circumRadius*mesh.normDistance)^2))
hold on
loglog(kaList/(2*pi), QsListMie)
hold on
loglog(kaList/(2*pi), QsListMieApprox)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{s} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie','approx.')

figure
loglog(kaList/(2*pi), sigmaAbsList/...
    (pi*(mesh.circumRadius*mesh.normDistance)^2))
hold on
loglog(kaList/(2*pi), QaListMie)
hold on
loglog(kaList/(2*pi), QaListMieApprox)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{a} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie','approx.')

figure
loglog(kaList/(2*pi), sigmaExtList/...
    (pi*(mesh.circumRadius*mesh.normDistance)^2))
hold on
loglog(kaList/(2*pi), QeListMie)
hold on
loglog(kaList/(2*pi), QeListMieApprox)
grid on
xlabel('$ a/\lambda $','Interpreter','latex','FontSize', 16)
ylabel('$ \sigma_\mathrm{e} / \left( \pi a^2 \right)$','Interpreter', ...
    'latex','FontSize', 16)
legend('MoM','Mie','approx.')


figure
semilogx(lambda0List/1e-6,real(epr))
hold on
semilogx(lambda0List/1e-6,imag(epr))
grid on
xlabel('$ \lambda \left[ \mu\mathrm{m} \right] $','Interpreter', ...
    'latex','FontSize', 16)
ylabel('$ \epsilon_\mathrm{r} \left[ - \right] $','Interpreter', ...
    'latex','FontSize', 16)
legend('Re \{\epsilon \}','Im \{\epsilon \}')
ylim([-20, 10])
xlim([0.2,12])


figure 
semilogx(fList/1e12,meshElSizeRe)
hold on
semilogx(fList/1e12,meshElSizeIm)
xlabel('$ f \left[ \mathrm{THz} \right] $','Interpreter', ...
    'latex','FontSize', 16) 
ylabel(['Mesh size control','$ \mathrm{} \left[ - \right] $'], ...
    'Interpreter','latex','FontSize', 16) 
grid on 
title('Electrical size of mesh - should be small')
legend('Re','Im')


figure 
plot(fList/1e12,worstTetRe,'o')
hold on
plot(fList/1e12,worstTetIm,'o')
xlabel('$ f \left[ \mathrm{THz} \right] $','Interpreter', ...
    'latex','FontSize', 16) 
ylabel('worst tetrahedron','Interpreter','latex','FontSize', 16) 
grid on 
legend('Re','Im')


%% plot scattering pattern
Ntheta = 30;
Nphi = 60;
thetaVec = linspace(0, pi, Ntheta);
phiVec = linspace(0, 2*pi, Nphi);
[phi, theta] = meshgrid(phiVec, thetaVec);

[Fphi, Ftheta] = ...
    farField.computeFarField(mesh, basisFunc, k0List(1, ika), ...
    theta, phi, quadOrder, I);

DMat = 2*pi*(abs(Fphi).^2 + abs(Ftheta).^2)/...
    (models.utilities.constants.Z0 * PradList(1, ika));

results.plotFarField('theta', thetaVec, 'phi', phiVec, ...
    'farField', DMat);