%% getPortValues get necessary values of ports for solver.
% It is not possible to get values if some port is invalid.
% This is public method.
%
%  INPUTS
%   frequencyList: list of frequency points for lumped circuit impedance
%                  computation. This is optional argument. Double [1 x N].
%
%  SYNTAX
%
%  values = feeding.getPortValues()
%  values = feeding.getPortValues(frequencyList)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
