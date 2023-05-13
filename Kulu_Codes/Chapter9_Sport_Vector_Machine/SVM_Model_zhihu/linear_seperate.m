clear, clc, close all;
group_1=normrnd(1,0.3,100,2);
label_1=ones(size(group_1,1),1);%第一类样本和标签
group_2=normrnd(3,0.3,100,2);
label_2=-ones(size(group_2,1),1);%第二类样本和标签
X=[group_1;group_2];
y=[label_1;label_2];%组成训练集
%产生测试集
tg1=normrnd(1,1,1000,2);
tlabel_1=ones(size(tg1,1),1);
tg2=normrnd(3,1,1000,2);
tlabel_2=-ones(size(tg2,1),1);
test_group=[tg1;tg2];
test_label=[tlabel_1;tlabel_2];
%% Training a SVM(Support Vector Machine) Classifier
C = 10;
svm = mysvmtrain(X, y, C, 'linear');
result = mysvmtest(svm, test_group, 'linear');
fprintf('Accuracy: %f\n', mean(double(result.y_pred == test_label)));
% 计算出偏差b
tmp_b= (svm.alphas' .* svm.vec_y' * kernels(svm.vec_x', svm.vec_x', 'linear'))';
total_bias = svm.vec_y - tmp_b;
true_b = mean(total_bias);
%计算w
w=svm.vec_x'*(svm.alphas' .* svm.vec_y')';
% 画出点以及对应的超平面
subplot(1,2,1);
plot(group_1(:,1),group_1(:,2),'ro','MarkerFace', 'r');
hold on
plot(group_2(:,1),group_2(:,2),'bo','MarkerFace', 'b');
hold on
k=-w(1)./w(2);%将直线改写成斜截式便于作图
bb=-true_b./w(2);
xx=-1:5;
yy=k.*xx+bb;
plot(xx,yy,'-')
hold on
yy=k.*xx+bb+1./w(2);
plot(xx,yy,'--')
hold on
yy=k.*xx+bb-1./w(2);
plot(xx,yy,'--')
title('Hard-SVM Training')
xlabel('Dimension1')
ylabel('Dimension2')
legend('Group1 for training','Group2 for training','Separating Hyperplane')
grid on;
%在训练集上的表现
subplot(1,2,2);
plot(tg1(:,1),tg1(:,2),'ro','MarkerFace', 'r');
hold on
plot(tg2(:,1),tg2(:,2),'bo','MarkerFace', 'b');
hold on
k=-w(1)./w(2);%将直线改写成斜截式便于作图
bb=-true_b./w(2);
xx=-1:5;
yy=k.*xx+bb;
plot(xx,yy,'-')
hold on
yy=k.*xx+bb+1./w(2);
plot(xx,yy,'--')
hold on
yy=k.*xx+bb-1./w(2);
plot(xx,yy,'--')
title('Hard-SVM Testing')
xlabel('Dimension1')
ylabel('Dimension2')
legend('Group1 for testing','Group2 for testing','Separating Hyperplane')
grid on;