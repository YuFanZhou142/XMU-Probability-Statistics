% 任务2: 用逆变换法生成 Rayleigh 分布随机变量并绘图
clc; clear; close all;

N = 10000;
sigma_values = [0.5, 1, 2];
U = rand(1, N);

figure;
for i = 1:3
    sigma = sigma_values(i);
    X = sigma * sqrt(-2 * log(1 - U));  % 逆CDF变换
    subplot(1,3,i);
    histogram(X, 50, 'Normalization', 'pdf');
    title(['Rayleigh 分布 \sigma = ', num2str(sigma)]);
end
