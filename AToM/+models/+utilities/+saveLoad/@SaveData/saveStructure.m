%% saveStructure saves structure to data storage
% This is a hidden method of class SaveData.
%
%  INPUTS
%   structure: data which shoud be saved, double/ struct [N x N]
%   frequencyID: frequency identificator, double [1 x 1]
%   frequency: frequency, double [1 x 1]
%   fileName: name of new file, char [1 x N]
%   dataType: type of saved data, char [1 x N]
%   subFolder1: first level subfolder, char [1 x N]
%               - typically name of model/solver
%   subFolder2: second level subfolder, char [1 x N]
%
%  SYNTAX
%   obj.saveStructure(structure, [], [], 'newFile', 'dataType');
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
