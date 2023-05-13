clc
clear;
n=200;
p=0.4;
z=zeros(n)
Se=rand(n)<p;
Sd=zeros(n+2);%矩阵初始化
Ph=image(cat(3,Se,z,z));%初始可视化
while(1)
    Sd(2:n+1,2:n+1)=Se;%
    Sum=Sd(1:n,2:n+1)+Sd(3:n+2,2:n+1)+Sd(2:n+1,1:n)+Sd(2:n+1,3:n+2)+Sd(1:n,1:n)+Sd(3:n+2,1:n)+Sd(1:n,3:n+2)+Sd(3:n+2,3:n+2);
%邻居之和（邻居中生的元胞的数目）
    for i=1:n
    for j=1:n
    if Sum(i,j)==3||(Sum(i,j)==2&&Se(i,j)==1)%生的条件
        Se(i,j)=1;
    else 
            Se(i,j)=0;
    end
    end
end
set(Ph,'cdata',cat(3,Se,z,z))%更新可视化
   drawnow
end
    
            
        





