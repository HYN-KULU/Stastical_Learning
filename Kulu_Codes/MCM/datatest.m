clear;clc;
num=input("Please input two numbers:");
if num(1)==1||num(2)==1
disp("I can do more than that.")
else 
matrix=zeros(num(1),num(2));
for i=1:num(1)
for j=1:num(2)
if rem(i,2)==0 && rem(j,2)==1
matrix(i,j)=0;
elseif rem(i,2)==1 && rem(j,2)==0
matrix(i,j)=0;
else
matrix(i,j)=1;
end
end
end
disp(matrix)
end