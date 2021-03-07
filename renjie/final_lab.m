
addpath D:\SDMBIGDAT19-master\SDMBIGDAT19-master\CODES
addpath D:/GWSC21/SIGNALS
addpath D:/GWSC21/DETEST
addpath D:/GWSC21/MDC
%% data
TrainingData = load('TrainingData.mat');
analysisData = load('analysisData.mat');
dataY = analysisData.dataVec;
% Number of samples and sampling frequency.
nSamples= length(dataY);     %2048
Fs = analysisData.sampFreq;   %1024

% Search range of phase coefficients
rmin = [40, 1, 1];
rmax = [100, 50, 15];

%% Estimate the noise PSD from TrainingData
[pxx,f] = pwelch(TrainingData.trainData,Fs/2,[],[],Fs);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('noise PSD');

% Smooth the PSD estimate
smthOrdr = 10;
b = ones(1,smthOrdr)/smthOrdr;
pxxSmth = filtfilt(b,1,pxx);
hold on;
semilogy(f,pxxSmth);


dataLen = nSamples/Fs;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq = interp1(f,pxxSmth,posFreq);

%% PSO
% Number of independent PSO runs
nRuns = 8;

dataX = (0:(nSamples-1))/Fs;
% Input parameters for CRCBQCHRPPSO
inParams = struct('dataX', dataX,...
                  'dataY', dataY,...
                  'dataXSq',dataX.^2,...
                  'dataXCb',dataX.^3,...
                  'psdPosFreq',psdPosFreq,...
                  'sampFreq',Fs,...
                  'rmin',rmin,...
                  'rmax',rmax);
% CRCBQCHRPPSO runs PSO on the CRCBQCHRPFITFUNC fitness function. As an
% illustration of usage, we change one of the PSO parameters from its
% default value.              
outStruct = crcbqcpsopsd(inParams,struct('maxSteps',2000),nRuns);

%% Plot
figure;
hold on;
plot(dataX,dataY,'.');

for lpruns = 1:nRuns
    plot(dataX,outStruct.allRunsOutput(lpruns).estSig,'Color',[51,255,153]/255,'LineWidth',4.0);
end
plot(dataX,outStruct.bestSig,'Color',[76,153,0]/255,'LineWidth',2.0);
legend('analysisData','estSig1','estSig2','estSig3','estSig4','estSig5','estSig6','estSig7','estSig8','BestSig');
disp(['Estimated parameters: a1=',num2str(outStruct.bestQcCoefs(1)),...
                             '; a2=',num2str(outStruct.bestQcCoefs(2)),...
                             '; a3=',num2str(outStruct.bestQcCoefs(3))]);
