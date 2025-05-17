%% computeApparentLineLength computes real length to line at distance
% distanceLineCamera from camera in the way that line is wantedLengthPx long.
%
%  INPUTS
%   distanceLineCamera: distance from camera to line, units are the same as axes
%                       units, double [1 x 1]
%   cameraViewAngle: view angle of camera in degrees, holds in yDirection,
%                    double [1 x 1]
%   axesHeightPx: height of axes in pixels, double [1 x 1]
%   wantedLengthPx: wanted length of line in pixels, double [1 x 1]
%
%  OUTPUTS
%   lineLength: real length of line which will be show on the screen as line
%               with length wantedLengthPx, double [1 x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode
