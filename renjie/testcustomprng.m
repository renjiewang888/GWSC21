M=10000;
%generate 10000 trials values frm U(x;-2,1)
xVec1=zeros(1,M);
for i =1:M
    xVec1(i)=customrand(-2,1);
end
x=-2:0.1:1
y=pdf('Uniform',x,-2,1)
figure;
hold on;
histogram(xVec1,'normalization','pdf');
plot(x,y,'LineWidth',2,'color','red');
title('U(x;-2,1)');

%generate 10000 trials values frm N(x;1.5,2.0)
xVec2=zeros(1,M);
for i =1:M
    xVec2(i)=customrandn(1.5,2.0);
end
x=-6:0.1:10
y=pdf('Normal',x,1.5,2.0)
figure;
hold on;
histogram(xVec2,'normalization','pdf');
plot(x,y,'LineWidth',2,'color','red');
title('N(x;1.5,2.0)');