clear;clc;
load CData.mat
x1=zscore(x1);
x2=zscore(x2);
x3=zscore(x3);
x4=zscore(x4);
x5=zscore(x5);
y1=zscore(y1);
y2=zscore(y2);
y3=zscore(y3);
mu=zscore(mu);
sigma=zscore(sigma);
A=[mu,sigma,x1,x2,x3,x4,x5,y1,y2,y3];
correlation_matrice=corrcoef(A);