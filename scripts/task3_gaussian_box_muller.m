function summary = task3_gaussian_box_muller()
%TASK3_GAUSSIAN_BOX_MULLER Task 3: generate Gaussian samples with the Box-Muller transform.

script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

addpath(fullfile(project_root, 'src'));

output_dir = fullfile(project_root, 'results', 'figures');
ensure_directory(output_dir);

rng(20250633, 'twister');

sample_count = 10000;
mu = 0;
sigma_values = [0.5, 1, 2];

summary = repmat(struct( ...
    'sigma', 0, ...
    'sample_mean', 0, ...
    'sample_variance', 0, ...
    'theoretical_mean', 0, ...
    'theoretical_variance', 0), 1, numel(sigma_values));

gaussian_figure = figure('Name', 'Task 3 Gaussian', 'Position', [100, 100, 1400, 420]);

for idx = 1:numel(sigma_values)
    sigma = sigma_values(idx);
    samples = generate_gaussian_box_muller(sample_count, mu, sigma);

    summary(idx).sigma = sigma;
    summary(idx).sample_mean = mean(samples);
    summary(idx).sample_variance = var(samples);
    summary(idx).theoretical_mean = mu;
    summary(idx).theoretical_variance = sigma ^ 2;

    subplot(1, numel(sigma_values), idx);
    histogram(samples, 50, 'Normalization', 'pdf');
    hold on;

    x_values = linspace(min(samples), max(samples), 200);
    plot(x_values, normal_pdf_local(x_values, mu, sigma), 'r', 'LineWidth', 1.5);

    title(['高斯分布, \sigma = ', num2str(sigma)]);
    xlabel('x');
    ylabel('概率密度');
    legend('样本直方图', '理论 PDF', 'Location', 'northeast');
    grid on;
end

saveas(gaussian_figure, fullfile(output_dir, 'task3_gaussian.png'));

fprintf('任务3完成：Box-Muller 高斯样本已生成。\n');
for idx = 1:numel(summary)
    fprintf('  sigma = %.1f: 样本均值 = %.4f，样本方差 = %.4f\n', ...
        summary(idx).sigma, summary(idx).sample_mean, summary(idx).sample_variance);
end
end
