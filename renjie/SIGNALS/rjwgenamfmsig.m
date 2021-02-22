function sigVec = rjwgenamfmsig(data,snr,b,f0,f1)
% Generate a amplitude modulated(AM)-frequency modulated(FM) sinusoid
% S = RJWGENFMSIG(X,SNR,F0,F1,PHI0)
% Generates a amplitude modulated(AM)-frequency modulated(FM) sinusoid S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S. F0 and F1 are the
% frequency. 

%Renjie Wang, Feb 2021

sigVec = sin(2*pi*f0*dataX + b*cos(2*pi*f1*dataX))*cos(2*pi*f1*dataX);
sigVec = snr*sigVec/norm(sigVec);
