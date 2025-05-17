%% Find IDs of triangles contributing to the points
% Location of all points is compared with location of all triangles.
% The point coordinates are expressed in terms of simplex coordinates
% of the triangle(s). If the simplex coordinates satisfy all
% the necessary conditions, it means that the point is touching area
% of given trinagle.
%
%                3                  S = triangle area
%                o                  S1 = area of triangle "point-2-3"
%               /|\                 S2 = area of triangle "point-3-1"
%              / | \                S3 = area of triangle "point-1-2"
%             /  |  \
%            /   |d3 \              d1 = distance to node 1
%          c/    |    \b            d2 = distance to node 2
%          /  S2 | S1  \            d3 = distance to node 3
%         /     _o_     \
%        / d1_-     -_d2 \          simplex1,2,3 = simplex coordinates
%       /_--     S3    --_\
%      o-------------------o
%     1          a          2
%
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode docu
