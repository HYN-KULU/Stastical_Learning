function result = mysvmtest(model, X,kernel_type)
% 在svmTrain中我们主要计算的就是那几个支持向量, 对应的, 核心就是alpha
% 现在有了alpha, 我们通过公式可以轻而易举地计算出w, 我们还不知道b的值, 也即是超平面偏差的值
% 所有先将我们的支持向量代入到公式中, 计算出一个临时的w
% 对于一直的支持向量来说, 我们已经知道了它的label, 所有可以计算出b, 将超平面拉过来, 再将这个b运用到测试集中即可
tmp = (model.alphas' .* model.vec_y' * kernels(model.vec_x', model.vec_x', kernel_type))';
% 计算出偏差, 也就是超平面的截距
total_bias = model.vec_y - tmp;
bias = mean(total_bias);
% 我们已经得到了alpha, 因为w是由alpha表示的, 所以通过alpha可以计算出w
% w = sum(alpha .* y_sv)*kernel(x_sv, x_test)
% 其中y_sv是sv的标签, x_sv是sv的样本, x_test是需要预测的数据
w=model.vec_x'*(model.alphas' .* model.vec_y')';
wx= (model.alphas' .* model.vec_y' * kernels(model.vec_x', X', kernel_type))';
result.w = w;
result.b = bias;
result.y_pred = sign(wx+ bias);
result.product=wx+ bias;
end