addpath D:\GWSC21\renjie/SIGNALS
% signal parameters
A=10
B=10
f0=1e-5
phi0=pi/2

% sky location
theta = [1/10,1/5,1/2]*pi
phi = [1/4,1/2,1/3]*pi
psi = [1/8,1/4,1/2]*pi

% Instantaneous frequency after 1 yr is 
maxFreq = f0 ;
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:365*24*3600;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
hp = rjwgensinsig(timeVec,A,f0,0)
hc = rjwgensinsig(timeVec,B,f0,phi0);

%Generate the antenna pattern function values Fp, Fc
fPlus = zeros(length(theta),length(phi));
fCross = zeros(length(theta),length(phi));
for lp1 = 1:length(phi)
    for lp2 = 1:length(theta)
        [fPlus(lp2,lp1),fCross(lp2,lp1)] = detwaveframefpfc(theta(lp2),phi(lp1),psi(lp1));
    end
end

%strain signal
for lp1 = 1:length(fPlus)
    s(lp1,:) = hp * fPlus(lp1) + hc * fCross(lp1) 
end


%plot the strain signal
subplot(3,1,1);
plot(timeVec, s(1,:),'Marker','.');
subplot(3,1,2);
plot(timeVec, s(2,:),'Marker','.');
subplot(3,1,3);
plot(timeVec, s(3,:),'Marker','.');


