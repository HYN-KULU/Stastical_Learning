clc
clear
n = 5;                           % 定义表示森林的矩阵大小
Plight = 5e-6; Pgrowth = 1e-2;     % 定义闪电和生长的概率  
UL = [n,1:n-1]; DR = [2:n,1];      % 定义上左，下右邻居
veg=zeros(n,n);                    % 初始化表示森林的矩阵
imh = image(cat(3,veg,veg,veg));   % 可视化表示森林的矩阵
% veg = 空地为0 着火为1 树木为2
for i=1:3000 
    sum =(veg(UL,:)==1) + (veg(:,UL)==1)+(veg(:,DR)==1) +  (veg(DR,:)==1);  % 计算出所有格子有几个邻居是着火的
% 根据规则更新森林矩阵：是否树=是否树-是否着火的树+是否新生的树（0-1运算）
    veg = 2*(veg==2) - ( (veg==2) & (sum>0 |(rand(n,n)<Plight)) ) +2*((veg==0) & rand(n,n)<Pgrowth) ;  
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),zeros(n)) )
    drawnow                         % 可视化表示森林的矩阵
end