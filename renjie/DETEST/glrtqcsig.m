function GLRT = glrtqcsig(dataVec,psdPosFreq,qcCoefs,sampFreq)
%Calculate GLRT for a quadratic chirp signal.
%GLRT = GLRTQCSIG(X,PSD,B,fs)
%X is the input data vectro, PSD is the positive DFT frequency, B is the
%vector of input parameters [a1,a2,a3], fs is the sampling frequency.
% 
%Generate the unit norm signal (i.e., template). Here, the value used for
%'A' does not matter because we are going to normalize the signal anyway.
%Note: the GLRT here is for the unknown amplitude case, that is all other
%signal parameters are known
nSamples = length(dataVec);
timeVec = (0:(nSamples-1))/sampFreq;
sigVec = crcbgenqcsig(timeVec,1,[qcCoefs(1),qcCoefs(2),qcCoefs(3)]);
%We do not need the normalization factor, just the  template vector
[templateVec,~] = normsig4psd(sigVec,sampFreq,psdPosFreq,1);
% Calculate inner product of data with template
llr = innerprodpsd(dataVec,templateVec,sampFreq,psdPosFreq);
%GLRT is its square
GLRT = llr^2;

end

