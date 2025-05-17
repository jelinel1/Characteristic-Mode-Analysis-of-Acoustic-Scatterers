%  MESH_COLLECTION: Collection of meshing examples from MESH2D users.
%
%  mesh_collection(n) will run the nth example.
%
%  1. Simple square domain. Used for "driven cavity" CFD studies.
%
%  2. Rectangular domain with circular hole. Used in thermally coupled CFD
%     studies to examine the flow around a heated pipe.
%
%  3. Rectangular domain with circular hole and user defined size
%     functions. Used in a CFD study to examine vortex shedding about
%     cylinders.
%
%  4. Rectangular domain with 2 circular holes and user defined size
%     functions. Used in a CFD study to examine the unsteady flow between
%     cylinders.
%
%  5. Rectangular domain with square hole and user defined size functions.
%     Used in a CFD study to examine vortex shedding about square prisms.
%
%  6. 3 element airfoil with user defined size functions and boundary layer
%     size functions. Used in a CFD study to examin the lift/drag
%     characteristics.
%
%  7. U shaped domain.
%
%  8. Rectangular domain with step. Used for "backward facing step" CFD
%     studies.
%
%  9. NACA airfoil with boundary layer size functions. Used in a CFD study
%     to examine the lift/drag vs. alpha characteristics.
%
%  10. Wavy channel from Kong Zour. Used in a CFD study to examine unsteady
%      behaviour.
%
%  11. Tray of glass beads from Falk Hebe. Used in a CFD study to examine the flow
%      through past a collection of beads.
%
%  12. "Kidney" shape from Andrew Hanna
%
%  13. Crack geometry from Christoph Ortner.
%
%  14. Africa + Europe + Asia coastline extracted via CONTOUR.m
%
%  15. Simple geometric face.
%
%  16. River system geometry.
%
%  17. Coastline data from Francisco Garcia. PLEASE NOTE! This is a very
%      complex example and takes a bit of processing time (50 sec on my
%      machine).
%
% I am always looking for new meshes to add to the collection, if you would
% like to contribute please send me an email with an m-file description of
% the NODE, EDGE, HDATA and OPTIONS used to setup the mesh.
%
% Darren Engwirda    : 2006-2009
% Email              : d_engwirda@hotmail.com
