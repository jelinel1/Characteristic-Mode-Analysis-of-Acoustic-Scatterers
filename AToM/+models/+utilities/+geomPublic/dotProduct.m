%% dotProduct find dot product between two sets of vectors
% This function determines dotproduct of two sets of 3D vectors.
%
%  INPUTS
%   vect1: set of vectors, double [nV1 x 3]
%   vect2: set of vectors, double [nV2 x 3]
%   mode: optional, normalization of dot product vector, char [1 x N]
%
%  OUTPUTS
%   dotProd: dot product, struct [nV1 x nV2]
%
%  SYNTAX
%
%  dotProd = models.utilities.geomPublic.dotProduct(vect1, vect2)
%
% Function dotProduct determines dot product of two sets of 3D vectors
% determined bz _vect1_ and _vect2_.
%
%  dotProd = models.utilities.geomPublic.dotProduct(vect1, vect2, mode)
%
% Mode of output vector specified by user in _mode_. Default mode is
% 'normalized', other option is 'notModified'.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
