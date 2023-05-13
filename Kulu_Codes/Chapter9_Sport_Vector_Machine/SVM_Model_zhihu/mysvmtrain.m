function [model] = mysvmtrain(X, y, C, kernel_type)
% 函数的核心就是对拉格朗日对偶式的二次规划问题, 通过返回的alpha得到我们需要的支持向量
%X中 样本是横着放的
% the number of training examples.
m = length(y);

% 为了解决对偶问题（这是一个二次规划问题），我直接调用了MATLAB自带的quadprog函数
H = y * y' .* kernels(X', X', kernel_type);
f = -ones(m, 1);
A = [];
b = [];
Aeq = y';
beq = 0;
lb = zeros(m, 1);
% C is the regularization parameter which means that our model has already
% taken the error into the consideration.
ub = C * ones(m, 1);
alphas0 = zeros(m, 1);
epsilon = 1e-8;
options = optimset('LargeScale', 'off', 'Display', 'off');
alphas1 = quadprog(H, f, A, b, Aeq, beq, lb, ub, alphas0, options);
%以上都是调用quadprog函数的过程
logic_vector = abs(alphas1) > epsilon;
model.vec_x = X(logic_vector, :);%得到支持向量
model.vec_y = y(logic_vector);
model.alphas = alphas1(logic_vector);
end