% This script evaluates characteristic modes of an ideally stiff Helmoltz
% resonator. The theory is described in DOI: XXXXX
% Each frequency point costs approximately 50 seconds on a regular laptop. 
% The entire frequency sweep will take approx. 1.75 hours. If you do not 
% want to wait and just want to plot the results, go to line 106, and load the 
% precalculated data. You can then continue in the script.

clear all;
close all;
clc;

%% load mesh

[nodes, ~, connectivityList, ~, ~] = ...
    models.utilities.meshPublic.importNastran ...
    ([pwd,'\meshHelmholtzResonator.nas']);

% create mesh structure
mesh = models.utilities.meshPublic.getMeshData2D(nodes, connectivityList);

%% plot mesh
options.showEdges = true;
options.showTriangles = true;
hndlMesh = results.plotMesh(mesh, 'options', options);
hndlMesh.triangles.FaceColor = 'flat';
hndlMesh.triangles.FaceVertexCData = repmat([255,255,153]/255, ...
    [mesh.nTriangles,1]);
view(-36,33);

% triange opacity
hndlMesh.triangles.FaceAlpha = 0.6;

% plot triangle normals
hold on
quiver3(mesh.triangleCentroids(:,1), mesh.triangleCentroids(:,2),...
    mesh.triangleCentroids(:,3), ...
    mesh.triangleNormals(:,1)*mesh.normDistanceA/3, ...
    mesh.triangleNormals(:,2)*mesh.normDistanceA/3, ...
    mesh.triangleNormals(:,3)*mesh.normDistanceA/3, 'r');

%% Set frequency range and initialize variables

c0 = 343; % speed of sound [m/s]
rho0 = 1.225; % density of air [kg/m^3]
Z0 = rho0*c0; % planewave impedance

% list of frequencies
fList = [linspace(50,119,30),linspace(120,129,15),...
    linspace(130,136,30), linspace(137,151,23), linspace(152,210,30)];

% number of frequencies
Nka = size(fList,2);

k0List = 2*pi*fList/c0; % wavenumber
kaList = k0List*mesh.normDistanceA; % electric size

% maximum order of spherical waves
iota = 2;
lmax   = ceil(max(kaList) + 3 + iota*max(kaList)^(1/3));

%% Solver settings
verbosity = 1;
quadOrder = 5;

%% Solve MoM

waitBar = [];

% precalculate static reaction integrals
[gIntStatic, DgIntStatic] = staticBEMintegrals(mesh, quadOrder, verbosity, waitBar);

% eigenvectors of T and correcpoding eigenvalues
fTcell = cell(1,Nka);
tTcell = cell(1,Nka);

for ika = 1:Nka
    tic
    k0 = k0List(1,ika); % wavenumber [1/m]

    % dynamic reaction integrals
    [gIntDynamic, DgIntDynamic] = dynamicBEMintegrals(mesh, quadOrder, k0, verbosity, waitBar);
    
    % This is -D from the paper
    A0 = diag(mesh.triangleAreas) + (DgIntStatic + DgIntDynamic);

    % S-matrix
    [Sp, Sdp, indexMatrix] = sMatrix(mesh, quadOrder, k0, Z0, lmax, verbosity, waitBar);

    % boundary condition -Zsurf*vn = p gives dp = p*1i*k0*Z0/Zsurf
    % f = - Sp*p - Sdp*dp = - (Sp + Sdp*1i*k0*Z0/Zsurf)*p = - S*p
    
    % Zsurf --> Inf
    T = 1i*k0*Z0*Sp*mldivide(A0, Sdp');

    % evaluate characteristic modes for the actual frequency
    [fCM,DT] = eig(T);
    DT = diag(DT);
    [~,I] = sort(abs(DT),'descend');

    fTcell{1,ika} = fCM(:,I);
    tTcell{1,ika} = DT(I,1);

    disp(num2str(Nka - ika))
    toc
end

%% load results

% load('precalculatedCMdata.mat')

%% tracking of characteristic modes to provide smooth evolution of eigenvalues

nModes = 20; % number of tracked modes

tSorted = nan(nModes,Nka);
fSorted = cell(1,Nka);

fLeft = fTcell{1,1};
fLeft = fLeft(:,(1:nModes));

fRight = fTcell{1,1};
tRight = tTcell{1,1};

tSorted(:,1) = tRight((1:nModes),1);
fSorted{1,1} = fRight(:,(1:nModes));

for ika = 2:Nka

    fRight = fTcell{1,ika};
    tRight = tTcell{1,ika};

    tmp = fLeft'*fRight;

    [val,I] = max(abs(tmp).');

    tSorted(:,ika) = tRight(I,1);
    fSorted{1,ika} = fRight(:,I);

    fLeft = fRight(:,I);
    fLeft = fLeft(:,(1:nModes));

end

%% plot modals significances

figure
for iMode = 1:nModes
    plot(fList(1,:),(abs(tSorted(iMode,:))),'-x')
    hold on
end
grid on
xlabel('$f  \left[ \mathrm{Hz} \right]$','Interpreter','latex','FontSize', 16)
ylabel('$|t_n|  \left[ - \right]$','Interpreter','latex','FontSize', 16)


%% single frequency results

% select frequency and recalculate matrices
ika = find(fList > 133.4,1);

k0 = k0List(1,ika);
[gIntStatic, DgIntStatic] = staticBEMintegrals(mesh, quadOrder, verbosity, waitBar);
[gIntDynamic, DgIntDynamic] = dynamicBEMintegrals(mesh, quadOrder, k0, verbosity, waitBar);

% This is -D from the paper
A0 = diag(mesh.triangleAreas) + (DgIntStatic + DgIntDynamic);
[Sp, Sdp, indexMatrix] = sMatrix(mesh, quadOrder, k0, Z0, lmax, verbosity, waitBar);

%% plot farfield

% choose a mode to plot
iMode = find(abs(tSorted(:,ika)) == max(abs(tSorted(:,ika))) );

fVec = fSorted{1,ika};
fVec = fVec(:,iMode);

% spherical angles for plotting
theta = linspace(0,pi,50);
phi = linspace(0,2*pi,100);

farfield = sphericalFarField(fVec, ones(size(fVec)), indexMatrix, Z0, theta, phi);

handleFarField = results.plotFarField('farField', farfield.D, ...
    'theta', theta, 'phi', phi);
view(-36,33);
handleFarField.type = 'farField';

%% plot surface presssure

p = -1i*k0*Z0*mldivide(A0, Sdp'*fVec);

handles = results.plotCharge(mesh, 'part', 'Abs', 'divJ', p);
% hold on
% quiver3(0, 0, 0, 2 * mesh.normDistanceA, 0, 0, 'r');
% quiver3(0, 0, 0, 0, 2 * mesh.normDistanceA, 0, 'g');
% quiver3(0, 0, 0, 0, 0, 2 * mesh.normDistanceA, 'b');
% title('surface pressure')
view(74,81)

%% evaluate scattered field

Rcyl = 0.165;
Lcyl = 0.7*Rcyl;
Lopen = 0.5*Rcyl;
Ropen = 0.15*Rcyl;
Xshift = Rcyl/2;
thickness = Ropen/2;

Nxgrid = floor(101*1.2); % y-z grid Ngrid x Ngrid
Nzgrid = 101;
[xGrid, zGrid] = meshgrid(linspace(-(Rcyl + thickness)*1.2,(Rcyl + thickness)*1.2, Nxgrid), ...
    linspace(- (Lcyl + thickness)*1.5, Lopen*2, Nzgrid));

% matrices for numerical scattered field
[Np, Ndp] = pScatt(mesh, quadOrder, k0List(1,ika), ...
    [reshape(xGrid,[Nxgrid*Nzgrid,1]), zeros(Nxgrid*Nzgrid,1) ,...
    reshape(zGrid,[Nxgrid*Nzgrid,1])], verbosity, waitBar);

% boundary condition -Z*vn = p gives dp = p*1i*k0*Z0/Z
% pScatt = Np*p + Ndp*dp = (Np + Ndp*1i*k0*Z0/Z)*p = N*p
N = Np;

% numerical evaluation of scattered field
pScattField = N*p;
pScattField = reshape(pScattField,[Nzgrid,Nxgrid]);

% avoid inner parts of the material

deltaDist = 1e-3;

ind = (abs(xGrid) > (Rcyl - deltaDist) ) &...
    (abs(xGrid) < (Rcyl + thickness + deltaDist) ) & ...
    (zGrid < (thickness + deltaDist)) & (zGrid > - (Lcyl + thickness - deltaDist) );

ind1 = (abs(xGrid) < (Rcyl + thickness + deltaDist) ) &...
     (zGrid < (thickness + deltaDist)) & (zGrid > - deltaDist );

ind2 = (abs(xGrid) < (Rcyl + thickness + deltaDist) ) &...
     (zGrid < - (Lcyl - deltaDist) ) & (zGrid > - (Lcyl + thickness + deltaDist) );

ind3 = (abs(xGrid - Xshift) > (Ropen - deltaDist) ) & ...
    (abs(xGrid - Xshift) < (Ropen + thickness + deltaDist) ) & ...
        (zGrid < (Lopen + deltaDist)) & (zGrid > 0);

ind4 = (abs(xGrid + Xshift) > (Ropen - deltaDist) ) & ...
    (abs(xGrid + Xshift) < (Ropen + thickness + deltaDist) ) & ...
        (zGrid < (Lopen + deltaDist)) & (zGrid > 0);

ind5 = (abs(xGrid - Xshift) < ( Ropen - deltaDist ) ) & ...
       (zGrid < (Lopen + deltaDist)) & (zGrid > - 2*thickness);

ind6 = (abs(xGrid + Xshift) < ( Ropen - deltaDist ) ) & ...
       (zGrid < (Lopen + deltaDist)) & (zGrid > - 2*thickness);

indTot = ind | ind1 | ind2 | ind3 | ind4 ;

indTot(ind5) = 0;
indTot(ind6) = 0;

figure
contourf(xGrid,zGrid,indTot)
grid on
pbaspect([2*(Rcyl + thickness)*1.2, 2*Lopen + (Lcyl + thickness)*1.5,1])
title('mask')
xlabel('$y  \left[ \mathrm{m} \right]$','Interpreter','latex','FontSize', 16)
ylabel('$z  \left[ \mathrm{m} \right]$','Interpreter','latex','FontSize', 16)



pScattField(indTot) = 0;

figure
contourf(xGrid,zGrid,log10(abs(pScattField)))
grid on
pbaspect([2*(Rcyl + thickness)*1.2, 2*Lopen + (Lcyl + thickness)*1.5,1])
title('log |pScatt|')
xlabel('$y  \left[ \mathrm{m} \right]$','Interpreter','latex','FontSize', 16)
ylabel('$z  \left[ \mathrm{m} \right]$','Interpreter','latex','FontSize', 16)