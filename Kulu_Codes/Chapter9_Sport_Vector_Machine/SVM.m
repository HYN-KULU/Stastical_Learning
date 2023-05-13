clc, clear
a0=load('fenlei.txt'); %把表中x1...x8的所有数据保存在纯文本文件fenlei.txt中
a=a0'; b0=a(:,[1:27]); dd0=a(:,[28:end]); %提取已分类和待分类的数据
[b,ps]=mapstd(b0); %已分类数据的标准化
dd=mapstd('apply',dd0,ps); %待分类数据的标准化
group=[ones(20,1); 2*ones(7,1)]; %已知样本点的类别标号
s=fitcsvm(b',group) %训练支持向量机分类器
sv_index=find(s.IsSupportVector)  %返回支持向量的标号
beta=s.Alpha  %返回分类函数的权系数
bb=s.Bias  %返回分类函数的常数项
check= predict(s,b');%验证已知样本点
err_rate=1-sum(group==check)/length(group) %计算已知样本点的错判率
predicting=predict(s,dd')%对待判样本点进行分类
