function [identifierBase, messageModelName, stack] = stackReduce(reduce)
%% stackReduce reduces error stack to single record
% This function reduces error stack and selects what information to display
% in the error message.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

nModels = numel(enumeration('controller.notification.Models'));
modelPaths = cell(1, nModels);
identifierBase = [];

modelPaths{controller.notification.Models.atom} = { ...
   'AToM'; ...
   'AToM\@Atom'; ...
   };

modelPaths{controller.notification.Models.filesystem} = { ...
   'AToM\+models\+HDF'; ...
   };

modelPaths{controller.notification.Models.history} = { ...
   'AToM\+controller\@History'; ...
   };

modelPaths{controller.notification.Models.geometry} = { ...
   'AToM\+models\+geom'; ...
   };

modelPaths{controller.notification.Models.mesh} = { ...
   'AToM\+models\+mesh'; ...
   };

modelPaths{controller.notification.Models.physics} = { ...
   'AToM\+models\@Physics'; ...   
   'AToM\+models\+feeding'; ...
   'AToM\+models\@SymmetryPlane'; ...   
   };

modelPaths{controller.notification.Models.solver} = { ...
   'AToM\+models\+solvers'; ...
   };

modelPaths{controller.notification.Models.workspace} = { ...
   'AToM\+models\@Variable'; ...
   'AToM\+models\@Workspace'; ...   
   };

% get stack
stack = dbstack('-completenames');
nStack = numel(stack);

stackModel = zeros(1, nStack);
stackModelLast = 0;

stackSelection = [];
for iStack = 1:nStack
   % get relative _filePath_, skip current record if it does not contain "AToM"
   filePath = stack(iStack).file;
   temp1 = strfind(filePath, 'AToM');
   if isempty(temp1)
      continue;
   end
   
   % let the path starting with AToM, force backslash
   filePath = strrep(filePath(temp1(end):end), filesep, '\');

   if strncmp(filePath, 'AToM\+controller\+notification\', 31)
      stackSelection = min(iStack + 1, nStack):nStack;
      continue;
   end
   
   atomCaller = regexprep(filePath(1:end-2), '(\\\+)|(\\@)|(\\)', ':');
   
   % If the _filePath_ belongs to AToM and _messageModelName_ is not found yet,
   % search for _filePath_ in _modelPaths_ to find appropriate
   % _messageModelName_. When _messageModelName_ is found.
   if isempty(identifierBase)
      identifierBase = atomCaller;
   end
   for iModels = 1:nModels
      nPaths = numel(modelPaths{iModels});
      for iPaths = 1:nPaths
         if ~isempty(strfind(filePath, modelPaths{iModels}{iPaths}))
            % add model name into _stackModel_ if not previously added
            stackModel(iStack) = iModels;
            break;
         end
      end
      if stackModel(iStack)
         if stackModel(iStack) == stackModelLast
            stackModel(iStack) = 0;
         else
            stackModelLast = iModels;
         end
         break;
      end
   end
end
clear stackModelLast;

stackModel = stackModel(stackModel > 0);
stackModel = num2cell(fliplr(stackModel));
stackModel = cellfun(@(x) regexprep(char(controller.notification.Models(x)), ...
   '(^[a-z])', '${upper($1)}'), stackModel, 'UniformOutput', false);
messageModelName = strjoin(stackModel, '>>');

% FIXME: make it cleaner

if exist('atomCaller', 'var')
   % there are some records in the stack which belong to Atom
   if isempty(messageModelName)
      % but their path cannot be located in _modelPaths_
      identifierBase = atomCaller;
      messageModelName = 'AToM';
   end
   if ~isempty(stackSelection)
      % remove "AToM\+controller\+notification\@Message" records from the stack
      stack = stack(stackSelection);
   end
   if reduce
      % return empty stack in case of simplified output
      stack = struct('file', [], 'name', [], 'line', []);
      stack(1) = [];
      stack = stack';
   end
   identifierBase = [identifierBase, ':'];
else
   % error has originated in some code outside Atom (command line)
   stack = struct('file', [], 'name', [], 'line', []);
   stack(1) = [];
   stack = stack';
end

end