function sigVec= rjwgenthreesinsig(dataX,snr,f0,phi0)
% Generate a signal containing the sum of three sinusoids 
% S = RJWGENTHREESINSIG(X,SNR,F0,PHI0)
% Generates a signal S containing the sum of three sinusoids [s1,s2,s3]. X is the vector of
% time stamps at which the samples of the signal are to be computed. 

%Renjie Wang, Feb 2021


sigVec1 = sin(2*pi*f0(1)*dataX + phi0(1));
sigVec2 = sin(2*pi*f0(2)*dataX + phi0(2));
sigVec3 = sin(2*pi*f0(3)*dataX + phi0(3));
sigVec = snr(1)*sigVec1/norm(sigVec1) + snr(2)*sigVec2/norm(sigVec2) + snr(3)*sigVec3/norm(sigVec3);

