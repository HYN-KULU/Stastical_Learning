function K = kernels(X1, X2, kernel_type)
%计算核函数
switch lower(kernel_type)    
   %线性核函数
    case 'linear'
        K = (X1' * X2);
   %多项式核函数，这里设置的3次核函数
    case 'polynomial'
        K = (X1' * X2).^3;
   %RBF核函数，需要设置核函数的带宽
    case 'rbf'    
        K=zeros(size(X1,2),size(X2,2));
        for m=1:size(X1,2)
            for n=1:size(X2,2)
                K(m,n)=exp(-sum((X1(:,m)-X2(:,n)).^2)/0.345);%这里设置的核带宽σ=0.345
            end
        end
          
end

end