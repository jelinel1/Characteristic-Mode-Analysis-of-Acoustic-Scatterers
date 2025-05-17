% LD : Drude-Lorentz model for the dielectric constant of metals and
%      Debye-Lorentz model for the dielectric constant of pure water
%***********************************************************************
%
%   Program author:    Bora Ung
%                      Ecole Polytechnique de Montreal
%                      Dept. Engineering physics
%                      2500 Chemin de Polytechnique
%                      Montreal, Canada
%                      H3T 1J4
%                      boraung@gmail.com
%
%             Date:    January 31, 2012
%***********************************************************************
%   DESCRIPTION:
%   This function computes the complex dielectric constant (i.e. relative
%   permittivity) of various metals using either the Lorentz-Drude (LD) or
%   the Drude model (D). The LD model is the default choice since it
%   provides a better fit with the exact values. The dielectric function of
%   pure water is calculated with a 2-pole Debye model valid for microwave
%   frequencies and a 5-pole Lorentz model valid for higher frequencies.
%
%   Reference [1] should be used to cite this Matlab code.
%
%   The Drude-Lorentz parameters for metals are taken from [2] while the
%   Debye-Lorentz parameters for pure water are from [3].
%
%***********************************************************************
%
%   USAGE: epsilon = LD(lambda,material,model)
%
%      OR: [epsilon_Re epsilon_Im] = LD(lambda,material,model)
%
%      OR: [epsilon_Re epsilon_Im N] = LD(lambda,material,model)
%
%
%   WHERE: "epsilon_Re" and "epsilon_Im" are respectively the real and
%          imaginary parts of the dielectric constant "epsilon", and "N"
%          is the complex refractive index.
%
%
%   INPUT PARAMETERS:
%
%       lambda   ==> wavelength (meters) of light excitation on material.
%                    Accepts either vector or matrix inputs.
%
%       material ==>    'Ag'  = silver
%                       'Al'  = aluminum
%                       'Au'  = gold
%                       'Cu'  = copper
%                       'Cr'  = chromium
%                       'Ni'  = nickel
%                       'W'   = tungsten
%                       'Ti'  = titanium
%                       'Be'  = beryllium
%                       'Pd'  = palladium
%                       'Pt'  = platinum
%                       'H2O' = pure water (triply distilled)
%
%       model    ==> Choose 'LD' or 'D' for Lorentz-Drude or Drude model.
%
%   REFERENCES:
%
%   [1] B. Ung and Y. Sheng, Interference of surface waves in a metallic
%       nanoslit, Optics Express (2007)
%   [2] Rakic et al., Optical properties of metallic films for vertical-
%       cavity optoelectronic devices, Applied Optics (1998)
%   [3] J. E. K. Laurens and K. E. Oughstun, Electromagnetic impulse,
%       response of triply distilled water, Ultra-Wideband /
%       Short-Pulse Electromagnetics (1999)
%
%***********************************************************************
