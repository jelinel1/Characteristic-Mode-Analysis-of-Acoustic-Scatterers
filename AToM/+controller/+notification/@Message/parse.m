function errorStruct = parse(obj, varargin)
%% parse divides input string to identifier and message
% Input string containing message <messageType>:<identifier>:<message> is
% converted into a struct compatible with function error.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

nInputs = numel(varargin) - 1;

% count special inputs
occurences = varargin{1} == '%';
percentSign = occurences(1:end-1) & occurences(2:end);
percentSign = [percentSign, 0] | [0, percentSign];
nExpectedInputs = sum(occurences(~percentSign));

obj.showIf(nInputs < nExpectedInputs, ...
   controller.notification.IO.notEnoughInputArguments);
varargin{1} = strcat(varargin{1}, ...
   repmat(' %s', 1, nInputs - nExpectedInputs));

originalMessage = sprintf(varargin{:});
colonPosition = strfind(originalMessage, ':');
errorStruct = struct(...
   'identifier', originalMessage(1:colonPosition(2)-1), ...
   'message', originalMessage(colonPosition(2)+1:end));

end

