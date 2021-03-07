%%Estimating significance
% Path to folder containing signal and noise generation codes.
addpath D:/GWSC21/SIGNALS
addpath D:/GWSC21/DETEST
addpath D:/GWSC21/NOISE
addpath D:/GWSC21/renjie/DETEST
% Number of samples and sampling frequency.
nSamples= 2048;
sampFreq = 1024;
timeVec = (0:(nSamples-1))/sampFreq;

%% Supply PSD values
% This is the noise psd we will use.
noisePSD = @(f) (f>=100 & f<=300).*(f-100).*(300-f)/10000 + 1;
dataLen = nSamples/sampFreq;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq = noisePSD(posFreq);


%% The signal in each data realzation is a quadratic chirp 
a1=10;
a2=3;
a3=3;
dataVec1 = load('D:\GWSC21\DETEST\data1.txt');
dataVec2 = load('D:\GWSC21\DETEST\data2.txt');
dataVec3 = load('D:\GWSC21\DETEST\data3.txt');
%% Compute GLRT
GLRT1 = glrtqcsig(dataVec1',psdPosFreq,[a1,a2,a3],sampFreq);
GLRT2 = glrtqcsig(dataVec2',psdPosFreq,[a1,a2,a3],sampFreq);
GLRT3 = glrtqcsig(dataVec3',psdPosFreq,[a1,a2,a3],sampFreq);

%% Estimate the significance
n=1e4;n1=0;n2=0;n3=0;
for i = 1:n
    noise= statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);
    GLRT = glrtqcsig(noise,psdPosFreq,[a1,a2,a3],sampFreq);
    if GLRT >GLRT1
        n1=n1+1;
    end
    if GLRT >GLRT2
        n2 =n2+1;
    end
    if GLRT >GLRT3
        n3=n3+1;
    end
end

signif1=n1/n;
signif2=n2/n;
signif3=n3/n;
disp(['significance of data1 is',num2str(signif1)]);
disp(['significance of data2 is',num2str(signif2)]);
disp(['significance of data3 is',num2str(signif3)]);








