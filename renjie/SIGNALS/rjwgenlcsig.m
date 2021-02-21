function sigVec = rjwgenlcsig(dataX,snr,f0,f1,phi0)
% Generate a linear chirp signal
% S = RJWGENLCSIG(X,SNR,F0,F1,PHI0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S. F0, F1 and PHI0 are
% three coefficients that parametrize the phase of the signal
% 2*pi*(f0*t+f1*t^2)+phi0

%Renjie Wang, Feb 2021

phaseVec = 2*pi*(f0*dataX +f1*dataX.^2) + phi0;
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);

