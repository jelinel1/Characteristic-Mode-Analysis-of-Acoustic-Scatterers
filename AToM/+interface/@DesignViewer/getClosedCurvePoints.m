%% getClosedCurvePoints add the last coordinate the same is the first one.
% To correctly plot some polygon as a line object, the last and the first
% coordinate of line has to be the same.
% Only instances of DesignViewer class can call this method.
%
%  INPUTS
%   openCoordinates: matrix with coordinates of all points on polygon. There are
%                    two possibilities. If openCoordinates is double class then
%                    it has to have size (M x 3N) where M is number of points in
%                    individual polygon and N in number of polygons. x, y and z
%                    coordinates of points are column vise.
%                    If the class of openCoordinates is cell, then in individual
%                    fields has to be coordinates of single curve. cell(M, 1).
%
%  OUTPUTS
%   closeadCoordinates: coordinates of points on closed curve. cell(M x 1).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
