clear;clc;
load top-five-data.mat
X = categorical(label(1:23));
X = reordercats(X,label(1:23));
Y = number(1:23);
b=bar(X,Y)
b.FaceColor = 'flat';
b.CData(1,:) = [.9 0 0];
b.CData(2,:) = [.9 0 0];
b.CData(3,:) = [.9 0 0];
b.CData(4,:) = [.9 0 0];
b.CData(5,:) = [.9 0 0];
for i=6:40
    b.CData(i,:)=[1,1,0]
end
xlabel('Fig.1 Overall adjusted mental disorder prevalence from Shandong in 2015');
set(gcf,'color','white');