%% add2DDiscretePort add 2D discrete port to structure.
% Discrete port can be pluged to 2D geometry objects.
%
%  INPUTS
%   varargin: First mandatory argument is number of port followed by
%             property-value pairs of discretePort arguments. Arguments are:
%   baseObjName: name of 2D geometry object.
%   positionPar: Relatively expressed positions of start and end point of
%                port. Port is represented as line in 2D geometrz object. When
%                object is meshed, port can be single or multi-edge. It depends
%                on mesh density. double [2 x 2] with number from interval
%                <0, 1>.
%                Parametrized positions for individual 2D objects:
%                parallelogram: [rel. lowLeft-lowRight; rel. lowLeft-highLeft]
%                               Port from low-left to high-left: [0 0; 0 1].
%                               Port from low-left to low-right: [0 1; 0 0].
%                ellipse: [startAngle endAngle; startDistFromCenter ...
%                          endDistFromCenter]
%   description: description of port, char [1 x N]
%
%  SYNTAX
%
%  feeding.add2DDiscretePort(portNumber, varargin)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
