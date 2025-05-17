%% findSuperiorChain find name of superior Group
% This method finds name of superior Group. If called recursively, it finds
% the whole chain of superior Group names.
%
%  INPUTS
%   groupObj: GroupObject
%   chain: names of previous superior GroupObjects, cell [1 x N]]
%
%  OUTPUTS
%   chain: GroupObject
%
%  SYNTAX
%
%  chain = groupObj.findSuperiorChain()
%
% The name of _groupObj_ superior Group is saved to _chain_.
%
%  chain = groupObj.findSuperiorChain(chain)
%
% The name of _groupObj_ superior Group is added to not empty _chain_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
