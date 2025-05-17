%% transformationMatrices compute transformation matrices for given operations
% Compute transformation matrices for given symmetry operations
%
%  INPUTS
%   symmetryOperations: list of symmetry operations, cell [nSymmetries x 1]
%   or char [N x 1]
%
%  OUTPUTS
%   T: transformation matrices, double [3 x 3 x nSymmetries]
%
%  |symmetryOperations| types:
%  * |E| .. identity
%  * |I| .. inverse
%  * |C:aaa:b| .. rotation by |2pi/b| around plane with normal vector
%     defined by |aaa|:
%   ** |'XY', 'XZ', 'YZ'| or |'Z', 'Y', 'X'|, respectivelly, for defined
%        symmetry plane or
%   ** |'A,B,C'|, where vector |n = [A B C]| is normal to mirror plane
%  * |Sig:aaa| .. reflection where:
%   ** |aaa|: normal vector of reflection plane as above
%  * |S:aaa:b| .. rotary-reflection by |2pi/b| around plane with normal vector
%     defined by |aaa|. It is computed as |T = T1 * T2|, where |T1| is
%     computed by rotation matrix |C:aaa:b| and |T2| is computed by
%     reflection matrix |Sig:aaa|.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
