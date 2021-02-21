function sigVec = rjwgenfmsig(dataX,snr,b,f0,f1)
% Generate a frequency modulated(FM) signal
% S = RJWGENFMSIG(X,SNR,B,F0,F1)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S. F0 and F1 are the
% frequency.

%Renjie Wang, Feb 2021

phaseVec = 2*pi*f0*dataX + b*cos(2*pi*f1*dataX);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);

