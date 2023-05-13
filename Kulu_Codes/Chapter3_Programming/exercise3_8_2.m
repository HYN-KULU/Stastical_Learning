f=@(x)[x(1)^2+x(2)-6;x(2)^2+x(1)-6];
xy=fsolve(f,rand(2,1))