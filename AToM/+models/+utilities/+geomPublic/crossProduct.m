%% crossProduct find cross product between two sets of vectors
% This function determines crossproduct of two sets of 3D vectors.
%
%  INPUTS
%   vect1: set of vectors, double [nV1 x 3]
%   vect2: set of vectors, double [nV2 x 3]
%   mode: optional, normalization of cross product vector, char [1 x N]
%
%  OUTPUTS
%   crossProd: cross product, struct [1 x 1]
%     .x: x-coordinates, double [nV1 x nV2]
%     .y: y-coordinates, double [nV1 x nV2]
%     .z: z-coordinates, double [nV1 x nV2]
%
%  SYNTAX
%
%  crossProd = models.utilities.geomPublic.crossProduct(vect1, vect2)
%
% Function crossProduct determines cross product of two sets of 3D vectors
% determined bz _vect1_ and _vect2_.
%
%  crossProd = models.utilities.geomPublic.crossProduct(vect1, vect2, mode)
%
% Mode of output vector specified by user in _mode_. Default mode is
% 'normalized', other option is 'notModified'.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
