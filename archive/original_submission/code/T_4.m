% 实验四：根据例1的分布律生成离散随机变量并绘制直方图
clc; clear; close all;

N = 10000;  % 样本数量

% 离散随机变量取值和对应概率（例1中的分布）
X_vals = [1, 2, 3, 4];
P_vals = [0.20, 0.15, 0.25, 0.40];

% 累积分布函数（CDF）
CDF = cumsum(P_vals);  % [0.20 0.35 0.60 1.00]

% 生成均匀分布随机变量 U
U = rand(1, N);
result = zeros(1, N);

% 映射 U → 离散值 X
for i = 1:N
    idx = find(U(i) <= CDF, 1);  % 查找落在哪个区间
    result(i) = X_vals(idx);    % 映射成对应离散值
end

% 绘制直方图
figure;
histogram(result, 'BinMethod', 'integers', 'Normalization', 'probability');
title('实验四：离散随机变量样本分布直方图');
xlabel('X 值'); ylabel('相对频率');
xticks(X_vals);  % 设置横轴刻度

% 输出样本频率统计
fprintf('实验样本频率统计（N = %d）：\n', N);
for i = 1:length(X_vals)
    freq = sum(result == X_vals(i)) / N;
    fprintf('P(X = %d) ≈ %.4f（理论值 %.2f）\n', X_vals(i), freq, P_vals(i));
end
