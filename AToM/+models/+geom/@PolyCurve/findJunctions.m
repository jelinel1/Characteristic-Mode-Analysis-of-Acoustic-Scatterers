%% findJunctions find junctions between curveObj and PolyCurve
% Junction between _curveObj_ and all curves in _PolzCurve_ are found. The
% junction points are saved in cell obj.junctions in order {[1-2]; [1-3]; ...
% [1-N]; [2-3];...; [2-N]; ...; [N-1-N]} where numbers are curve indexes in the
% PolyCurve object.
%
%  INPUTS
%   obj: PolyCurve object
%   curveObj: curve to be added
%
%  SYNTAX
%
%  obj.addCurve(curveObj)
%
% Junction points between new curve object _curveObj_ and curves in PolyCurve
% object _obj_ are found. A cell _obj.junction_ is organized so that
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
