load CData.mat
data=CData{1:356,2};
data=flip(data);
data=data(1:27,1);
xdata=1:27;
ydata=data;