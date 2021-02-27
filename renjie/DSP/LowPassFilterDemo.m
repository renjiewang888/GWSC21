%% Low pass filter demo
addpath D:\GWSC21\renjie\SIGNALS;
sampFreq = 1024;
nSamples = 2048;

timeVec = (0:(nSamples-1))/sampFreq;

%% a signal containing the sum of three sinusoids
% Signal parameters
f01=100;
phi01=0;
A1 = 10;

f02=200;
phi02=pi/6;
A2 = 5;

f03=300;
phi03=pi/4;
A3 = 2.5;


%Maximum frequency
maxFreq = sampFreq/2;

disp(['The maximum frequency is ', num2str(maxFreq)]);

% Generate signal
sigVec = rjwgenthreesinsig(timeVec,[A1,A2,A3],[f01,f02,f03],[phi01,phi02,phi03]);

%Length of data 
dataLen = timeVec(end)-timeVec(1);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);

%% allow only s1 to pass through
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,((f01+f02)/2)/(sampFreq/2));
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure(11);
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);
title('sigVel');xlabel('Time (sec)');

%% Plot the periodogram
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);
% FFT of filtered signal
fftFiltSig = fft(filtSig);
% Discard negative frequencies
fftFiltSig = fftFiltSig(1:kNyq);

figure(12);
subplot(2,1,1);
plot(posFreq,abs(fftSig));
subplot(2,1,2);
plot(posFreq,abs(fftFiltSig));
xlabel('Frequency')
%% allow only s2 to pass through
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,[((f01+f02)/2)/(sampFreq/2),((f02+f03)/2)/(sampFreq/2)]);
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure(21);
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);
title('sigVel');xlabel('Time (sec)');

%% Plot the periodogram
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);
% FFT of filtered signal
fftFiltSig = fft(filtSig);
% Discard negative frequencies
fftFiltSig = fftFiltSig(1:kNyq);

figure(22);
subplot(2,1,1);
plot(posFreq,abs(fftSig));
subplot(2,1,2);
plot(posFreq,abs(fftFiltSig));
xlabel('Frequency')
%% allow only s3 to pass through
% Design low pass filter
filtOrdr = 30;
b = fir1(filtOrdr,((f02+f03)/2)/(sampFreq/2),'high');
% Apply filter
filtSig = fftfilt(b,sigVec);

%% Plots
figure(31);
hold on;
plot(timeVec,sigVec);
plot(timeVec,filtSig);
title('sigVel');xlabel('Time (sec)');

%% Plot the periodogram
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);
% FFT of filtered signal
fftFiltSig = fft(filtSig);
% Discard negative frequencies
fftFiltSig = fftFiltSig(1:kNyq);

figure(32);
subplot(2,1,1);
plot(posFreq,abs(fftSig));
subplot(2,1,2);
plot(posFreq,abs(fftFiltSig));
xlabel('Frequency')