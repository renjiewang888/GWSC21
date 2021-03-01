%% Test harness for FORMULAFP and SKYPLOT
addpath D:\GWSC21\renjie
%Azimuthal angle
phiVec = 0:0.1:(2*pi);
%Polar angle
thetaVec = 0:0.1:pi;

%Function handle: F+ and Fx from formula
fp = @(x,y) formulafp(x,y);
fc= @(x,y) formulafc(x,y)

figure;
skyplot(phiVec,thetaVec,fp);
title('F_+');
colorbar();
axis equal;

figure;
skyplot(phiVec,thetaVec,fc);
title('F_x');
colorbar;
axis equal;