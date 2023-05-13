clc
clear all;
n=200;
Se=zeros(n);
Z=zeros(n)
Se(n/2-2:n/2+2,n/2-2:n/2+2)=1;
Ch=imagesc(cat(3,Se,Z,Z));
axis square
Sd=zeros(n+2);
while(1)
    Sd(2:n+1,2:n+1)=Se;
    sum=Sd(1:n,2:n+1)+Sd(3:n+2,2:n+1)+Sd(2:n+1,1:n)+Sd(2:n+1,3:n+2);
    Se=mod(sum,2);
   
    set(Ch,'cdata',cat(3,Se,Z,Z))
    pause(0.05)
end
   figure
        
    
    
 
    
    



