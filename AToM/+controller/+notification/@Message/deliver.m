function deliver(obj, originalErrorStruct)
%% deliver delivers message to the user
% Original struct contains message and identifier. Identifier is divided into
% _messageType_ (ERROR/WARNING/NOTE) and "real" _identifier_. Message is
% supplemented with a model name (_modelName_), "real" identifier is
% supplemented with _identifierBase_. Error stack is filtered by stackReduce().
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

colonPosition = strfind(originalErrorStruct.identifier, ':');
messageType = originalErrorStruct.identifier(1:colonPosition(1)-1);
identifier = originalErrorStruct.identifier(colonPosition(1)+1:end);

% TODO: automatic word wrapping

switch messageType
   case 'ERROR'
      if ~isempty(obj.settingsAtom.message.saveStackTo)
         % TODO: save full dbstack to a file
%          disp('Saving full dbstack to a file....');
      end
      [identifierBase, modelName, stack] = obj.stackReduce(...
         obj.settingsAtom.message.reducedErrorStack);
      if ~isempty(identifierBase)
         errorStruct = struct(...
            'identifier', [identifierBase, identifier], ...
            'message', ['[', modelName,']: ', originalErrorStruct.message], ...
            'stack', stack);
      else
         errorStruct = struct(...
            'identifier', sprintf('MATLAB:%s', identifier), ...
            'message', originalErrorStruct.message, ...
            'stack', stack);
      end
      error(errorStruct);
      
   case 'NOTE'
      % FIXME: why showing of notes depend on property called 'saveLogsTo' which
      % can't be edited via setProperties method?! VA
      if ~isempty(obj.settingsAtom.message.saveLogsTo)
         [~, modelName, ~] = obj.stackReduce(false);
         fileID = fopen(obj.settingsAtom.message.saveLogsTo, 'at');
         if fileID > 0
         fprintf(fileID, '%s [%s]:%s\n', ...
            datestr(now, 'yyyy-mm-dd HH:MM:SS.fff'), ...
            modelName, messageContent);
         fclose(fileID);
         else
            show(controller.notification.IO.notEnoughInputArguments);
         end
      end
      
   case 'WARNING'
      messageColor = '*[1, 0.5, 0]';
      [~, modelName, ~] = obj.stackReduce(...
         obj.settingsAtom.message.reducedErrorStack);
      models.utilities.thirdParty.cprintf(messageColor, ...
         sprintf('WARNING[%s]:%s\n\n', modelName, originalErrorStruct.message));
end

end

