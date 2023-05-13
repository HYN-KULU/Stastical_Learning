% nchoosek(4,2)
sum=0;
P=0;
for i=1:10
sum=sum+(-1)^(i+1)*nchoosek(10,i)*((10-i)/10)^30;
end
P=1-sum;
disp(sum);
