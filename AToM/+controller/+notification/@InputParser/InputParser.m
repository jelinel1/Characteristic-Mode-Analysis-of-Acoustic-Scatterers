classdef InputParser < inputParser
   %% InputParser is AToM-specific implementation of MATLAB class inputParser
   % The class has to be modified in order to get customizable error messages.
   %
   % Included in AToM, info@antennatoolbox.com
   % (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
   
   properties
      message
   end
   
   methods
      function obj = InputParser
         obj = obj@inputParser;
         obj.message = controller.notification.Message;
      end
   end
   
end

