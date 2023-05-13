clc,clear
load x.txt   %原始的x组的数据保存在纯文本文件x.txt中
load y.txt   %原始的y组的数据保存在纯文本文件y.txt中
p=size(x,2);q=size(y,2);
x=zscore(x);y=zscore(y);   %标准化数据

% 如何求相关系数矩阵
r=corrcoef([x,y])

n1=6;n2=4;num=min(n1,n2);
s1=r([1:n1],[1:n1]);  %提出X与X的相关系数
s12=r([1:n1],[n1+1:end]); %提出X与Y的相关系数
s21=s12'; %提出Y与X的相关系数
s2=r([n1+1:end],[n1+1:end]); %提出Y与Y的相关系数
m1=inv(s1)*s12*inv(s2)*s21; %计算矩阵M1，式（10.60）
m2=inv(s2)*s21*inv(s1)*s12; %计算矩阵M2，式（10.60）
[vec1,val1]=eig(m1); %求M1的特征向量和特征值
for i=1:n1
    vec1(:,i)=vec1(:,i)/sqrt(vec1(:,i)'*s1*vec1(:,i)); %特征向量归一化，满足a's1a=1
    vec1(:,i)=vec1(:,i)/sign(sum(vec1(:,i))); %特征向量乘以1或－1，保证所有分量和为正
end
val1=sqrt(diag(val1));    %计算特征值的平方根
[val1,ind1]=sort(val1,'descend');  %按照从大到小排列
a=vec1(:,ind1(1:num))    %取出X组的系数阵
dcoef1=val1(1:num)    %提出典型相关系数
[vec2,val2]=eig(m2);  
for i=1:n2
    vec2(:,i)=vec2(:,i)/sqrt(vec2(:,i)'*s2*vec2(:,i)); %特征向量归一化，满足b's2b=1
    vec2(:,i)=vec2(:,i)/sign(sum(vec2(:,i))); %特征向量乘以1或－1，保证所有分量和为正
end
val2=sqrt(diag(val2));    %计算特征值的平方根
[val2,ind2]=sort(val2,'descend');  %按照从大到小排列
b=vec2(:,ind2(1:num))    %取出Y组的系数阵
dcoef2=val2(1:num)    %提出典型相关系数