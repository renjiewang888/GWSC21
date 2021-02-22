function sigVec = rjwgenamsig(dataX,snr,f0,f1,phi0)
% Generate a amplitude modulated(AM) sinusoid
% S = RJWGENAMSIG(X,SNR,F0,F1,PHI0)
% Generates a amplitude modulated sinusoid S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S. F0 and F1 are the
% frequency. PHI0 is the phase of the signal.

%Renjie Wang, Feb 2021

sigVec = sin(f0*dataX + phi0)*cos(2*pi*f1*dataX);
sigVec = snr*sigVec/norm(sigVec);

