% 任务3: 利用 Box-Muller 方法生成高斯分布
clc; clear; close all;

N = 10000;
sigma_values = [0.5, 1, 2];
figure;

for i = 1:3
    sigma = sigma_values(i);
    U1 = rand(1, N);
    U2 = rand(1, N);
    
    R = sigma * sqrt(-2 * log(U1));
    theta = 2 * pi * U2;
    
    X = R .* cos(theta);  % 生成一个高斯分布分量
    
    subplot(1,3,i);
    histogram(X, 50, 'Normalization', 'pdf');
    title(['高斯分布 \sigma = ', num2str(sigma)]);
    
    disp(['sigma = ', num2str(sigma), ' 时，样本方差为：', num2str(var(X))]);
end
