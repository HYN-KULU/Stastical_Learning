clc,clear
load attribute.mat  %把原始的x1,x2,x3,x4,y的数据保存在纯文本文件sn.txt中
% b=zscore(sn);
b=sn(:,1:4);
r=corrcoef(b);
[vec1,lamda,rate]=pcacov(r)
% y1=0.2129*x1-0.6398*x2+0.1564*x3+0.6966*x4-0.1890*x5;
% y2=0.6236*x1+0.0755*x2-0.4124*x3+0.1459*x4+0.6435*x5;
% y3=0.5756*x1+0.3670*x2+0.7176*x3-0.0359*x4-0.1328*x5;
