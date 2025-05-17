%%GEN_IFS_FRACTAL: Generates iterated-function-system (IFS) collage
%
% Syntax:
%     IFSfractal = gen_ifs_fractal(base_object,transformations,iteration)
%
% Examples:
%     IFS1 = gen_ifs_fractal(pt1,tr1,2)
%     where:  pts  = [-50 -30;50 -30;50 30;-50 30];
%             trns = [1/5 0 0 1/3 0 0; ...
%                     0.45 0 0 0.45 27.5 17.5; ...
%                     0.45 0 0 0.45 27.5 -17.5; ...
%                     0.45 0 0 0.45 -27.5 17.5; ...
%                     0.45 0 0 0.45 -27.5 -17.5];
%__________________________________________________________________________
% Input:
%     pts  ~ matice bodu, inicializacni polygon [x1 y1;x2 y2; ...]
%     trns ~ matice afinnich transformaci ve formatu
%               [a1 b1 c1 d1 e1 f1;
%                a2 b2 c2 d2 e2 f2;
%                ...]
%     iter ~ integer oznacujici pocet iteraci
%__________________________________________________________________________
% Output:
%     IFSfractal ~ pole v?ech polygonu z posledni iterace,
%                  size(IFSfractal) ~ (length(pts),2,size(trns,1)^iter)
%__________________________________________________________________________
%
% gen_ifs_fractal version history:
%    ver. 1.0 (22.9.2011)
%
%
%    Last update: 22.9.2011
%
% Notes:
% A) size(pts,1) > 1 (at least 2 points)
%
% B) size(trns,1) > 0 (at least 1 affine transformation)
%
% C) iter > 0 (iteration number must be greater than 1)
%
% Author(s): Miloslav Capek, miloslav.capek@fel.cvut.cz, 2011
%
% See also draw_fractal
% docu
