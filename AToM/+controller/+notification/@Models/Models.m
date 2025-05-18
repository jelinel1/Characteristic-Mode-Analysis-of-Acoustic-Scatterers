classdef Models < int32
   %% Models user-friendly names of models
   % This enumeration class contains friendly names for AToM namespaces.
   % Numbers in this class must be consecutive, starting from 1. Values with
   % higher numbers are more general (atom must have greatest value).
   %
   % Included in AToM, info@antennatoolbox.com
   % (c) 2015, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
   
   enumeration
      atom(8)
      filesystem(1)
      history(2)
      geometry(3)
      mesh(4)
      physics(5)
      solver(6)
      workspace(7)
   end
   
end

