clear;clc;
load not_processed_difficulty.mat
X=[mu,score];
% X = [(randn(200,2)*0.75)+1;
%     (randn(200,2)*0.25)-1];
X=zscore(X);%对数据矩阵进行标准化处理
scatter(X(:,1),X(:,2));
title('Difficulty Distribution');
Z = linkage(X,'ward');
dendrogram(Z,300);
% T = cluster(Z,'cutoff',4,'Depth',6);
T = cluster(Z,'maxclust',5);
gscatter(X(:,1),X(:,2),T)
group1=find(T==1); % Hell Level
group2=find(T==2); % Hard Level
group3=find(T==3); % Entry Level (最简单)
group4=find(T==4); % Easy Level
group5=find(T==5); % Medium Level