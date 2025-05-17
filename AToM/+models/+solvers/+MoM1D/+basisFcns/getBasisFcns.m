%% getBasisFcns makes a list of basis functions
% Basis functions form an approximation of the unknown field quantity (electric
% current) over the structure. Since we are using Galerkin approach,
% the list of basis functions is list of the testing function at the same time.
% Eeach two adjacent edges form a rooftop function.
%
%
%                               _.o._             - - - 1
%                          _.-*   |   *-._
%                     _.-*        |        *-._
%      nodePlus  _.-*             |             *-._  nodeMinus
%              o------------------o------------------o
%                    edgePlus    node  edgeMinus
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
