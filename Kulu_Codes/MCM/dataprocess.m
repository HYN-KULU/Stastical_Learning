load CData
% x1:vowel
x1=CData{1:356,13};
x2=CData{1:356,14};
x3=CData{1:356,15};
x4=CData{1:356,16};
x5=CData{1:356,17};
sn=[x1,x2,x3,x4,x5];
sn=zscore(sn);
x1=sn(1:356,1);
x2=sn(1:356,2);
x3=sn(1:356,3);
x4=sn(1:356,4);
x5=sn(1:356,5);
% b=zscore(matrice);
% r=corrcoef(b);
% d=pdist(b',"correlation");
% z=linkage(d,'average');
% h=dendrogram(z);
% set(h,'Color','k','LineWidth',1.3);
% T=cluster(z,'maxclust',2);