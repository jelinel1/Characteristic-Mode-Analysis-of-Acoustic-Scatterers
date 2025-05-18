classdef Message < handle
   %% Message log/error handling class
   % This class is managing error treatment and logs.
   %
   % Included in AToM, info@antennatoolbox.com
   % (c) 2015, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
   
   properties (SetAccess = private)
      settingsAtom
   end
   
   methods
      function obj = Message
        persistent uniqueInstance
         nArguments = nargin;
         if isempty(uniqueInstance)
            if nArguments == 0% && isa(env, 'SettingsAtom')
               obj.settingsAtom = internal.atomPreferences;
               uniqueInstance = obj;
            else
               errorStruct = struct(...
                  'identifier', 'Atom:unableToObtainSettings', ...
                  'message', '[AToM]: Unable to obtain settings.');
               error(errorStruct);
            end
         else
            obj = uniqueInstance;
         end
      end
      
      function quit(obj)
         delete(obj)
      end
   end
   
   methods
      show(obj, message, varargin)
      showIf(obj, condition, message, varargin)
      validateAttributes(obj, varargin)
      validStr = validateString(varargin)
   end
   
   methods(Access = {...
         ?controller.notification.Message, ...
         ?controller.notification.InputParser})
         deliver(obj, originalErrorStruct)      
   end
   
   methods(Static, Access = {...
         ?controller.notification.Message, ...
         ?controller.notification.InputParser})
      [identifierBase, messageModelName, stack] = stackReduce(reduce)
   end
   
   methods(Access = private)
      errorStruct = parse(obj, varargin)      
   end
   
end

