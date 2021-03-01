function strain = genstrain(hp,hc,theta,phi)
%generate strain signal for a static interferometer
%inputs: hp : h_+
%        hc : h_x
%        theta: the polar angle\
%        phi: the azimuthal angle 

%   Renjie Wang, Feb,2021
addpath '../GWSIG'
[fp,fc] = detframefpfc(theta,phi);
strain = hp * fp + hc * fc;
end

