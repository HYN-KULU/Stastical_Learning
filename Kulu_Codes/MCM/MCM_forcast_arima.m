clc,clear;
load MCM_data.mat
load EstMd.mat

dx_Forecast=forecast(EstMd,108,'Y0',diff_train_data);
x_Forecast=a(250)+cumsum(dx_Forecast);
hold on;
plot([251:358],x_Forecast,'b');
plot([1:358],a,"k");
hold off;