clc, clear,alpha=0.1;
load MCM_data.mat
load distribution_result.mat
a=MCM_data{1,6:12};
mu=distribution_result(1,1);
sigma=distribution_result(1,2);
x=1:0.01:7;
y=pdf("norm",x,mu,sigma)*100;
hold on;
plot(x,y,"r")
bar(a)
