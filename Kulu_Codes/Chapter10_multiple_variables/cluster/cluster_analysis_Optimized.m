clc,clear
a=[1,0;1,1;3,2;4,3;2,5];
a=zscore(a);%对数据矩阵进行标准化处理
y=pdist(a,'cityblock');  %求a的两两行向量间的绝对值距离
yc=squareform(y)  %变换成距离方阵
z=linkage(y)  %产生等级聚类树
dendrogram(z) %画聚类图
cluster_number=4;
T=cluster(z,'maxclust',cluster_number)  %把对象划分成cluster_number类
for i=1:cluster_number
    tm=find(T==i);  %求第i类的对象
    tm=reshape(tm,1,length(tm)); %变成行向量
    fprintf('第%d类的有%s\n',i,int2str(tm)); %显示分类结果
end
gscatter(a(:,1),a(:,2),T)