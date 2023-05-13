load AllWord.mat
x1=zscore(x1);
x2=zscore(x2);
x3=zscore(x3);
x4=zscore(x4);
b=[x1,x2,x3,x4];
r=corrcoef(b);
[vec1,lamda,rate]=pcacov(r)
y1=0.2471*x1-0.6431*x2+0.1283*x3+0.7134*x4;
y2=0.7992*x1+0.4121*x2+0.4372*x3+0.016*x4;
y3=-0.4358*x1-0.0952*x2+0.8899*x3-0.0950*x4;
y=[y1,y2,y3];