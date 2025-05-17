%% notifySubscribers notify subscriber from obj's subscriber list.
% This method is inherited from superclass controller.Publisher. Only instances
% inherited from this superclass can call this method. All inputs are mandatory!
%
%  INPUTS
%   publishers: can be ,atrix of arbitrary type of objects which have to have
%               implemented update() method, obj [m x n]
%   identifier: identifier of event, which caused this calling of update method
%               of subscribers of publishers. char or enumeration convertible
%               to char [1 x n]
%   updateData: arbitrary auxiliary data useful for update of subscriber.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
