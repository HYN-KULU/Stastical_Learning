%% 求解线性规划
for i=1:n % Aeq为约束等式的系数矩阵
Aeq=[X eye(m) zeros(m,s) -X(:,i)
Y zeros(s,m) -eye(s) zeros(s,1)]
beq=[zeros(m,1) % beq为常数项
Y(:,i)];
w(:,i)=linprog(f,A,b,Aeq,beq,LB,UB) % 解线性规划，得DMUi的最佳权向
end
