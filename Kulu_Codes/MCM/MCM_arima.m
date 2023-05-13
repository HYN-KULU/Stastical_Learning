clc,clear;
load MCM_data.mat
a=flip(MCM_data{:,4});
train_data=a(1:250);
test_data=a(270:358);
r11=autocorr(train_data)   %计算自相关函数
r12=parcorr(train_data)   %计算偏相关函数
diff_train_data=diff(train_data);      %计算1阶差分
r21=autocorr(diff_train_data)  %计算自相关函数
r22=parcorr(diff_train_data)   %计算偏相关函数
n=length(diff_train_data);  %计算差分后的数据个数
k=0; %初始化试探模型的个数
for i=0:3
    for j=0:3
        if i==0 & j==0
            continue
        elseif i==0
            ToEstMd=arima('MALags',1:j,'Constant',0); %指定模型的结构
        elseif j==0
            ToEstMd=arima('ARLags',1:i,'Constant',0); %指定模型的结构
        else
            ToEstMd=arima('ARLags',1:i,'MALags',1:j,'Constant',0); %指定模型的结构
        end
        k=k+1; R(k)=i; M(k)=j;
        [EstMd,EstParamCov,logL,info]=estimate(ToEstMd,diff_train_data); %模型拟合
        numParams = sum(any(EstParamCov)); %计算拟合参数的个数
        %compute Akaike and Bayesian Information Criteria
        [aic(k),bic(k)]=aicbic(logL,numParams,n);
    end
end
fprintf('R,M,AIC,BIC的对应值如下\n %f');  %显示计算结果
check=[R',M',aic',bic']
r=input('输入阶数R＝');m=input('输入阶数M＝');
% ToEstMd=arima('ARLags',1:r,'MALags',1:m,'Constant',0); %指定模型的结构
ToEstMd=arima('ARLags',1:r,'MALags',1:m); %指定模型的结构
[EstMd,EstParamCov,logL,info]=estimate(ToEstMd,diff_train_data); %模型拟合
