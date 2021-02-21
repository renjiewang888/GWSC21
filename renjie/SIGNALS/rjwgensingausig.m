function sigVec = rjwgensingausig(dataX,snr,t0,sigma,f0,phi0)
% Generate a sine-gaussian signal
% S = RJWGENsingausig(X,SNR,T0,F0,PHI0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S. F0 is the frequency and
% PHI0 is the phase of signal.

%Renjie Wang, Feb 2021

phaseVec = 2*pi*f0*dataX + phi0;
sigVec = exp(-(dataX-t0).^2/2/sigma.^2)*sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);

