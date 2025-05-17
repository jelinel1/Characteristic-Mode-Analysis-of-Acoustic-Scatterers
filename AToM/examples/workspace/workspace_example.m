%% workspace_example shows complete Workspace capabilities.
% This script shows all public Workspace capabilities.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% show content of workspace
% now it is empty
tab1 = atom.selectedProject.workspace.table

%% adding public variables

% add variable a = 5 with description
atom.selectedProject.workspace.addVariable('a', 5, 'length of antenna');

% definig variable 'b' with the same value as 'a' in base workspace
a = 1e3;
atom.selectedProject.workspace.addVariable('b', a, 'dimension');

% variable 'c' will be the same as 'a' in atom workspace (1e3)
atom.selectedProject.workspace.addVariable('c', 'a'); % description is not mandatory

% adding variable 'd' which is computed from 'a' and 'b' from atom workspace
atom.selectedProject.workspace.addVariable('d', 'a+b', 'sum');

% add string variable
atom.selectedProject.workspace.addVariable('string_var', '''text'''); % ''' is necessary

% Show content of Workspace
tab2 = atom.selectedProject.workspace.table

% adding of n-dimensional variables
atom.selectedProject.workspace.addVariable('D3','randn(3, 3, 3)');
atom.selectedProject.workspace.addVariable('D5','true(2, 2, 2, 5, 3)', ...
   '5D logical var.');

% add function handle
atom.selectedProject.workspace.addVariable('handleV', '@mean');

% using handle function
atom.selectedProject.workspace.addVariable('values', '1:2:10')
atom.selectedProject.workspace.addVariable('meam_values', 'handleV(values)', 'mean value')

% Show content of Workspace
tab3 = atom.selectedProject.workspace.table

% add complex value variable
atom.selectedProject.workspace.addVariable('exponencial', 'exp(1i*3)', 'complex');

% it is possible to put in directly only isnumeric variables with 2 dimensions
% maximally
atom.selectedProject.workspace.addVariable('magic_matrix1', magic(3));
% or
atom.selectedProject.workspace.addVariable('magic_matrix2', 'magic(3)');
% or
matrix = magic(3);
atom.selectedProject.workspace.addVariable('magic_matrix3', matrix);

% add logical variables
atom.selectedProject.workspace.addVariable('logic1', true); % valid
atom.selectedProject.workspace.addVariable('logic2', mat2str(true)); % valid, input is string
atom.selectedProject.workspace.addVariable('logic3', 'false'); % valid

% Show content of Workspace
tab4 = atom.selectedProject.workspace.table

%% It is neccessary to add variables in correct order to be possible evaluate them
% overloading of Matlab functions is possible
% unsloved variables will have NaN value

atom.selectedProject.workspace.addVariable('handle_cos', '@cos');
atom.selectedProject.workspace.addVariable('sin', pi/2);
atom.selectedProject.workspace.addVariable('integr', ...
   'integral(handle_cos, 0, sin)');

% Show content of Workspace
tab5 = atom.selectedProject.workspace.table

%% Deleting variables
% only supported input to deleteVariable is name of variable
% workspace.deleteVariable('a')
atom.selectedProject.workspace.deleteVariable('magic_matrix1');
% Show content of Workspace
tab6 = atom.selectedProject.workspace.table

%% Renaming variable emp to empt
atom.selectedProject.workspace.addVariable('emp', '[]');
atom.selectedProject.workspace.editName('emp', 'empt');
% Show content of Workspace
tab7 = atom.selectedProject.workspace.table

%% Edit expression
atom.selectedProject.workspace.editExpression('empt', '''I was emp''');
% Show content of Workspace
tab8 = atom.selectedProject.workspace.table

%% Edit description
atom.selectedProject.workspace.editDescription('handle_cos', 'function handle');
% Show content of Workspace
tab9 = atom.selectedProject.workspace.table

%% Getting value of some variable from Workspace
valueA = atom.selectedProject.workspace.getValue('string_var');
valueD3 = atom.selectedProject.workspace.getValue('D3');

%% it is not possible to add variables with expression containing who, which,
% whos, clear, eval, (, ), {, }

% workspace.addVariable('e1', 'who');
% workspace.addVariable('f1', 'which(obj)');
% workspace.addVariable('g1', 'struct2cell( whos )');
% workspace.addVariable('h1', '( clear all )');
% workspace.addVariable('k1', 'eval(''format C'')');
% workspace.addVariable('l1', 'a(5)');
% workspace.addVariable('m1', 'b{2, 2}');

%% there is not possible to add variables with name who, which,
% whos, clear, eval

% workspace.addVariable('who', '5');
% workspace.addVariable('which', '5');
% workspace.addVariable('whos', '5');
% workspace.addVariable('clear', '5');
% workspace.addVariable('eval', '5');

%% assign variables from AToM Workspace to Matlab Workspace
atom.selectedProject.workspace.assignInMatlab();

%% eval expression in atom Workspace
valueOne = atom.selectedProject.workspace.evalExpression('exp(0)');
atom.selectedProject.workspace.addVariable('for_value', [1 2 3]);
value = atom.selectedProject.workspace.evalExpression('2*for_value');

%% validation of expression
% to ensure if expression of future variable will be accepted with workspace can
% be used static function
% It does not make computation of expression.

[isValid1, validatedExpression1] = ...
   models.utilities.validateVariableExpression('expression');
[isValid2, validatedExpression2] = ...
   models.utilities.validateVariableExpression('true');
% output is char:
[isValid3, validatedExpression3] = ...
   models.utilities.validateVariableExpression(true);
% output is char:
[isValid4, validatedExpression4] = ...
   models.utilities.validateVariableExpression([1 2 3]);

%% Quit atom
atom.quit