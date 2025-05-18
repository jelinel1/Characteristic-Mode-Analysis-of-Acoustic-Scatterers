function parse(obj, varargin)
%% parse overloads MATLABs parse method
% Method parse is overloaded to enable showing specific error messages using
% method deliver().
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

try
   parse@inputParser(obj, varargin{:});
catch ME
   obj.message.deliver(ME);
end

end

