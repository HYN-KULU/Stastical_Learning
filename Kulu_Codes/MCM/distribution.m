clear,clc;
load MCM_data.mat
data_proportion=MCM_data{:,6:12};
for i=1:358
    mean_value(i)=0;
    for j=1:7
        mean_value(i)=mean_value(i)+data_proportion(i,j)*j/100;
    end
    sum=0;
    for k=1:7
        sum=sum+data_proportion(i,k)*(k-mean_value(i))^2;
    end
    variance(i)=sum/99;
end
mean_value=mean_value(:);
variance=variance(:);
distribution_result=[mean_value,variance];