%load the data file
data=load('D:\GWSC21\NOISE\testData.txt');
timeVec=data(:,1);
value=data(:,2);
figure;
plot(timeVec,value);

%Number of samples to generate
nSamples = length(timeVec);
%Sampling frequency for noise realization
sampFreq = 1024; %Hz

% Estimate the noise PSD
k= find(timeVec>=5,1);
[pxx,f]=pwelch(value(1:k), 256,[],[],sampFreq);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');

% Design FIR filter with T(f)= square root of estimated PSD
sqrtPSD = sqrt(pxx);
fltrOrdr = 500;
b = fir2(fltrOrdr,f/(sampFreq/2),sqrtPSD);

%whiten the data
whitenvalue= sqrt(sampFreq)*fftfilt(b,value);
figure;
plot(timeVec,whitenvalue);

%Plot a spectrogram
%----------------
winLen = 0.2;%sec
ovrlp = 0.1;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*sampFreq);
ovrlpSmpls = floor(ovrlp*sampFreq);
[S,F,T]=spectrogram(value,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');

[S,F,T]=spectrogram(whitenvalue,winLenSmpls,ovrlpSmpls,[],sampFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');


