% 任务3: 利用 Box-Muller 方法生成高斯分布并叠加理论曲线
clc; clear; close all;

N = 10000;
sigma_values = [0.5, 1, 2];
figure;

for i = 1:3
    sigma = sigma_values(i);
    U1 = rand(1, N);
    U2 = rand(1, N);
    
    % Box-Muller 极坐标法
    R = sigma * sqrt(-2 * log(U1));
    theta = 2 * pi * U2;
    
    X = R .* cos(theta);  % 单个高斯分量
    
    % 绘制直方图
    subplot(1,3,i);
    histogram(X, 50, 'Normalization', 'pdf');
    hold on;
    
    % 添加理论正态分布 PDF 曲线
    x_range = linspace(min(X), max(X), 200);
    pdf_theory = normpdf(x_range, 0, sigma);  % 理论 N(0, σ²)
    plot(x_range, pdf_theory, 'r', 'LineWidth', 1.5);
    
    % 标题和图例
    title(['高斯分布 \sigma = ', num2str(sigma)]);
    legend('样本直方图', '理论正态 PDF');
    xlabel('x'); ylabel('概率密度');
    
    % 输出方差
    fprintf('sigma = %.1f 时，样本方差 = %.4f\n', sigma, var(X));
end
