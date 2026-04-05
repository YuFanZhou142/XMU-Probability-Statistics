function summary = task4_discrete_random_variable()
%TASK4_DISCRETE_RANDOM_VARIABLE Task 4: generate a discrete random variable from a PMF.

script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

addpath(fullfile(project_root, 'src'));

output_dir = fullfile(project_root, 'results', 'figures');
ensure_directory(output_dir);

rng(20250634, 'twister');

sample_count = 10000;
value_space = [1, 2, 3, 4];
probability_space = [0.20, 0.15, 0.25, 0.40];

samples = generate_discrete_samples(value_space, probability_space, sample_count);
empirical_probabilities = zeros(size(value_space));

for idx = 1:numel(value_space)
    empirical_probabilities(idx) = sum(samples == value_space(idx)) / sample_count;
end

summary = struct();
summary.sample_count = sample_count;
summary.values = value_space;
summary.theoretical_probabilities = probability_space;
summary.empirical_probabilities = empirical_probabilities;

discrete_figure = figure('Name', 'Task 4 Discrete', 'Position', [100, 100, 1200, 420]);

subplot(1, 2, 1);
histogram(samples, 'BinMethod', 'integers', 'Normalization', 'probability');
title('离散随机变量样本分布');
xlabel('X');
ylabel('相对频率');
xticks(value_space);
grid on;

subplot(1, 2, 2);
bar(value_space - 0.15, probability_space, 0.3, 'FaceColor', [0.2, 0.4, 0.8]);
hold on;
bar(value_space + 0.15, empirical_probabilities, 0.3, 'FaceColor', [0.9, 0.5, 0.2]);
title('理论概率与实验频率对比');
xlabel('X');
ylabel('概率 / 频率');
xticks(value_space);
legend('理论概率', '实验频率', 'Location', 'northwest');
grid on;

saveas(discrete_figure, fullfile(output_dir, 'task4_discrete.png'));

fprintf('任务4完成：离散随机变量样本已生成。\n');
for idx = 1:numel(value_space)
    fprintf('  P(X = %d): 理论值 = %.2f，实验频率 = %.4f\n', ...
        value_space(idx), probability_space(idx), empirical_probabilities(idx));
end
end
