%% findCycles find junctions between curveObj and PolyCurve
% Junction between _curveObj_ and all curves in _PolzCurve_ are found. The
% junction points are saved in cell obj.segmentation.segments in order
% {[1-2]; [1-3]; [1-N]; [2-3];...; [2-N]; ...; [N-1-N]} where numbers are curve
% indexes in the PolyCurve object.
%
%  INPUTS
%   obj: PolyCurve object
%
%  SYNTAX
%
%  obj.findCycles()
%
% Junction points between new curve object _curveObj_ and curves in PolyCurve
% object _obj_ are found. A cell _obj.segmentation.segments is organized so that
% first cell contains position of junction points between Curve 2 and 1 in
% PolyCurve.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
