function summary = task1_wichmann_hill_uniform()
%TASK1_WICHMANN_HILL_UNIFORM Task 1: generate U(0,1) samples with Wichmann-Hill.

script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

addpath(fullfile(project_root, 'src'));

output_dir = fullfile(project_root, 'results', 'figures');
ensure_directory(output_dir);

sample_count = 10000;
seed_group_1 = [1000, 1061, 1156];
seed_group_2 = [585, 744, 911];

group_1_samples = generate_wichmann_hill(seed_group_1, sample_count);
group_2_samples = generate_wichmann_hill(seed_group_2, sample_count);

summary = struct();
summary.sample_count = sample_count;
summary.mean_group_1 = mean(group_1_samples);
summary.mean_group_2 = mean(group_2_samples);
summary.variance_group_1 = var(group_1_samples);
summary.variance_group_2 = var(group_2_samples);
summary.theoretical_mean = 0.5;
summary.theoretical_variance = 1 / 12;

hist_figure = figure('Name', 'Task 1 Histogram', 'Position', [100, 100, 1200, 420]);

subplot(1, 2, 1);
histogram(group_1_samples, 50, 'Normalization', 'pdf');
title('第一组种子的均匀分布直方图');
xlabel('u');
ylabel('概率密度');
grid on;

subplot(1, 2, 2);
histogram(group_2_samples, 50, 'Normalization', 'pdf');
title('第二组种子的均匀分布直方图');
xlabel('u');
ylabel('概率密度');
grid on;

saveas(hist_figure, fullfile(output_dir, 'task1_histograms.png'));

scatter_figure = figure('Name', 'Task 1 Scatter', 'Position', [100, 100, 1200, 420]);

subplot(1, 2, 1);
plot(group_1_samples(1:end-1), group_1_samples(2:end), '.', 'MarkerSize', 5);
title('第一组种子的相邻样本散点图');
xlabel('u(i)');
ylabel('u(i+1)');
grid on;

subplot(1, 2, 2);
plot(group_2_samples(1:end-1), group_2_samples(2:end), '.', 'MarkerSize', 5);
title('第二组种子的相邻样本散点图');
xlabel('u(i)');
ylabel('u(i+1)');
grid on;

saveas(scatter_figure, fullfile(output_dir, 'task1_scatter.png'));

fprintf('任务1完成：Wichmann-Hill 均匀分布样本已生成。\n');
fprintf('  第一组均值 = %.4f，方差 = %.4f\n', summary.mean_group_1, summary.variance_group_1);
fprintf('  第二组均值 = %.4f，方差 = %.4f\n', summary.mean_group_2, summary.variance_group_2);
fprintf('  理论参考：均值 = %.4f，方差 = %.4f\n', summary.theoretical_mean, summary.theoretical_variance);
end
