load group_info.mat
for i=1:356
    if(group_info(i,1)==1)
        group_info(i,2)=1;
    elseif(group_info(i,1)==2)
        group_info(i,2)=3;
    elseif(group_info(i,1)==3)
        group_info(i,2)=2;
    elseif(group_info(i,1)==4)
        group_info(i,2)=4;
    end
end

