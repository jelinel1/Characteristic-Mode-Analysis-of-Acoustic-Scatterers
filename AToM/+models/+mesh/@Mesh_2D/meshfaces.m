%  MESHFACES: 2D unstructured mesh generation for polygonal geometry.
%
% A 2D unstructured triangular mesh is generated based on a piecewise-
% linear geometry input. An arbitrary number of polygonal faces can be
% specified, and each face can contain an arbitrary number of cavities. An
% iterative method is implemented to optimise mesh quality.
%
% If you wish to mesh a single face, use MESH2D instead!
%
%  [p,t,fnum] = meshfaces(node,edge,face,hdata,options);
%
% OUTPUTS
%
%  P     = Nx2 array of nodal XY co-ordinates.
%  T     = Mx3 array of triangles as indicies into P, defined with a
%          counter-clockwise node ordering.
%  FNUM  = Mx1 array of face numbers for each triangle in T.
%
% INPUTS
%
% Blank arguments can be passed using the empty placeholder "[]".
%
% NODE defines the XY co-ordinates of the geometry vertices. The vertices
% for all faces must be specified:
%
%  NODE = [x1,y1; x2,y2; etc], xy geometry vertices specified in any order.
%
% EDGE defines the connectivity between the points in NODE as a list of
% edges. Edges for all faces must be specified:
%
%  EDGE = [n1 n2; n2 n3; etc], connectivity between nodes to form
%                              geometry edges.
%
% FACE defines the edges included in each geometry face. Each face is a
% vector of edge numbers, stored in a cell array:
%
%  FACE{1} = [e11,e12,etc]
%  FACE{2} = [e21,e22,etc]
%
% HDATA is a structure containing user defined element size information.
% HDATA can include the following fields:
%
%  hdata.hmax  = h0;                   Max allowable global element size.
%  hdata.edgeh = [e1,h1; e2,h2; etc];  Element size on specified geometry
%                                      edges.
%  hdata.fun   = 'fun' or @fun;        User defined size function.
%  hdata.args  = {arg1, arg2, etc};    Additional arguments for HDATA.FUN.
%
% Calls to user specified functions must accept vectorised input of the
% form H = FUN(X,Y,ARGS{:}), where X,Y are the xy coordinates where the
% element size will be evaluated and ARGS are optional additional arguments
% as passed by HDATA.ARGS.
%
% An automatic size function is always generated to ensure that the
% geometry is adequately resolved. The overall size function is the minimum
% of the user specified and automatic functions.
%
% OPTIONS is a structure array that allows some of the "tuning" parameters
% used in the solver to be modified:
%
%   options.mlim   : The convergence tolerance. The maximum percentage
%                    change in edge length per iteration must be less than
%                    MLIM { 0.02, 2.0% }.
%   options.maxit  : The maximum allowable number of iterations { 20 }.
%   options.dhmax  : The maximum allowable (relative) gradient in the size
%                    function { 0.3, 30.0% }.
%   options.output : Displays the mesh and the mesh statistics upon
%                    completion { TRUE }.
%
% EXAMPLE:
%
%   meshdemo                  % Will run the standard demos
%   mesh_collection(n)        % Will run some additional demos
%
% See also MESH2D, REFINE, SMOOTHMESH, DELAUNAYN
