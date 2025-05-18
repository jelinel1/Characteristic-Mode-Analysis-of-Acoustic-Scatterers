function show(obj, varargin)
%% show shows message and optionally throws exception
% Exception is invoked when the _message_ starts with "ERROR:".
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

% message = <messageType>:<identifier>:<message>
errorStruct = obj.parse(varargin{:});
% originalErrorStruct
%  .identifier
%  .message

obj.deliver(errorStruct);

end

