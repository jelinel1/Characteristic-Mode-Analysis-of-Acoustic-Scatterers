%% getBasisFcns makes a list of basis functions
% Basis functions form an approximation of the unknown field quantity (electric
% current density) over the structure. Since we are using Galerkin approach,
% the list of basis functions is list of the testing function at the same time.
% Eeach two adjacent triangles form a RWG basis function [1].
%
% [1] S. M. Rao, D. R.Wilton, and A. W. Glisson, "Electromagnetic scattering
% by surfaces of arbitrary shape," IEEE Trans. Antennas Propagat., vol. AP-30,
% pp. 409-418, May 1982.
%
%                               _.o._
%                          _.-*   |   *-._
%                     _.-*        e        *-._
%      nodePlus  _.-*             d             *-._  nodeMinus
%              o.   trianglePlus  g  triangleMinus  .o
%                 *-._            e            _.-*
%                      *-._       |       _.-*
%                           *-._  |  _.-*
%                                *o*
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
