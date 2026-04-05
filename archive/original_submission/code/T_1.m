% Wichmann-Hill 生成 (0,1) 均匀分布的随机变量
clc; clear; close all;

N = 10000;  % 样本数量

% 第一组种子
x1 = 1000; y1 = 1061; z1 = 1156;

% 第二组种子
x2 = 585; y2 = 744; z2 = 911;

% 初始化结果序列
u1 = zeros(1, N);
u2 = zeros(1, N);

% 参数
M1 = 30269; M2 = 30307; M3 = 30323;

% 生成第一组序列
for i = 1:N
    x1 = mod(171 * x1, M1);
    y1 = mod(170 * y1, M2);
    z1 = mod(172 * z1, M3);
    u1(i) = mod(x1/M1 + y1/M2 + z1/M3, 1);
end

% 生成第二组序列
for i = 1:N
    x2 = mod(171 * x2, M1);
    y2 = mod(170 * y2, M2);
    z2 = mod(172 * z2, M3);
    u2(i) = mod(x2/M1 + y2/M2 + z2/M3, 1);
end

% 绘制直方图
figure;
subplot(1,2,1);
histogram(u1, 50, 'Normalization', 'pdf');
title('第一组种子生成的随机数');
xlabel('u'); ylabel('概率密度');

subplot(1,2,2);
histogram(u2, 50, 'Normalization', 'pdf');
title('第二组种子生成的随机数');
xlabel('u'); ylabel('概率密度');
