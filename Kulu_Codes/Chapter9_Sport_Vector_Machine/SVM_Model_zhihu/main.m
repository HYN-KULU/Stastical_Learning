%% Initialize data
clear, clc, close all;
%% rbf
data1=xlsread('newcircle.csv','B2:D1001');
xx_1=data1(:,1:2);
xx=zscore(xx_1);%标准化
yy=data1(:,end);
for i=1:length(yy)
    if yy(i)==0;%将类别划分为-1
        yy(i)=-1;
    end
end
X=[xx(1:300,:);xx(501:800,:)];
y=[yy(1:300,:);yy(501:800,:)];
test=[xx(301:500,:);xx(801:end,:)];
test_group=[yy(301:500,:);yy(801:end,:)];
C = 10;
svm = mysvmtrain(X, y, C, 'rbf');
result = mysvmtest(svm, test, 'rbf');
fprintf('Accuracy: %f\n', mean(double(result.y_pred == test_group)));
%%训练结束，开始画图
x1_min = min(X(:, 1)) - 1;
x1_max = max(X(:, 1)) + 1;
x2_min = min(X(:, 2)) - 1;
x2_max = max(X(:, 2)) + 1;
[XX, YY] = meshgrid(x1_min:0.02:x1_max, x2_min:0.02:x2_max);
Z = mysvmtest(svm, [XX(:) YY(:)], 'rbf');
Z = reshape(Z.y_pred, size(XX));
subplot(1,2,1);
plot(X(1:300, 1), X(1:300, 2), 'bo', 'MarkerFace', 'r');
hold on;
plot(X(301:end, 1), X(301:end, 2), 'ro', 'MarkerFace', 'r');
hold on;
contour(XX, YY, Z);
hold off;
title('Learning training set with RBF kernel function');
xlabel('Dimension1');
ylabel('Dimension2');
legend('Group1 for training','Group2 for training','separate plane');

subplot(1,2,2);
plot(test(1:200, 1), test(1:200, 2), 'bo', 'MarkerFace', 'r');
hold on;
plot(test(201:end, 1), test(201:end, 2), 'ro', 'MarkerFace', 'r');
hold on;
contour(XX, YY, Z);
title('Testing separate plane with RBF kernel function');
xlabel('Dimension1');
ylabel('Dimension2');
legend('Group1 for testing','Group2 for testing','separate plane');
hold off;