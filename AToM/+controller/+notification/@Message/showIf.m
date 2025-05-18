function showIf(obj, condition, varargin)
%% showIf encapsulates message.show in a condition
% This function is an alternative for function assert().
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

if condition
   show(obj, varargin{:});
end

end

