clear;clc;
load not_processed_difficulty.mat
data=[mu,score];
data=[data;5.1760,7.2038];
% X = [(randn(200,2)*0.75)+1;
%     (randn(200,2)*0.25)-1];
index=0;
for m=1.1:0.1:2.5
index=index+1;
data=zscore(data);%对数据矩阵进行标准化处理
% scatter(data(:,1),data(:,2));
options = [m;100;1e-5;1]; % 控制参数
[center,U,obj_fcn] = fcm(data,4,options); 
% figure; 
% plot(data(:,1), data(:,2),'o'); 
% title('Demo'); 
% % grid on; 
% hold on; 
maxU = max(U); 
% index1=find(U(1,:)==maxU); 
% index2=find(U(2,:)==maxU); 
% index3=find(U(3,:)==maxU);
% index4=find(U(4,:)==maxU);
% % index5=find(U(5,:)==maxU);
% % line(data(index1,1),data(index1,2),'marker','*','color','g'); 
% % line(data(index2,1),data(index2,2),'marker','*','color','r'); 
% % line(data(index3,1),data(index3,2),'marker','*','color','b'); 
% % line(data(index4,1),data(index4,2),'marker','*','color','y'); 
% % line(data(index5,1),data(index5,2),'marker','*','color','m');
% plot([center([1 2 3 4],1)],[center([1 2 3 4],2)],'*','color','k') 
% hold off;
% group_info=zeros(356,1);
% group_info(index1)=ones(length(index1),1)*1;
% group_info(index2)=ones(length(index2),1)*2;
% group_info(index3)=ones(length(index3),1)*3;
% group_info(index4)=ones(length(index4),1)*4;
% gscatter(data(:,1),data(:,2),group_info);
credit(index)=mean(maxU);
end
% % figure
% % plot(obj_fcn)
% % title('Objective Function Values')   
% % xlabel('Iteration Count')