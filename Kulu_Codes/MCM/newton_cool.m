clc,clear;
load MCM_data.mat
a=flip(MCM_data{:,4});
for i=100:359
    y(i)=log(a(i)/a(100));
    x(i)=a(i)-a(100);
end
plot(x(100:359),-y(100:359),'k')