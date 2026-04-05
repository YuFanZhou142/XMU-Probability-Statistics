function summary = task2_rayleigh_inverse_transform()
%TASK2_RAYLEIGH_INVERSE_TRANSFORM Task 2: generate Rayleigh samples with inverse transform sampling.

script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

addpath(fullfile(project_root, 'src'));

output_dir = fullfile(project_root, 'results', 'figures');
ensure_directory(output_dir);

rng(20250632, 'twister');

sample_count = 10000;
sigma_values = [0.5, 1, 2];

summary = repmat(struct( ...
    'sigma', 0, ...
    'sample_mean', 0, ...
    'sample_variance', 0, ...
    'theoretical_mean', 0, ...
    'theoretical_variance', 0), 1, numel(sigma_values));

rayleigh_figure = figure('Name', 'Task 2 Rayleigh', 'Position', [100, 100, 1400, 420]);

for idx = 1:numel(sigma_values)
    sigma = sigma_values(idx);
    samples = generate_rayleigh_samples(sample_count, sigma);

    summary(idx).sigma = sigma;
    summary(idx).sample_mean = mean(samples);
    summary(idx).sample_variance = var(samples);
    summary(idx).theoretical_mean = sigma * sqrt(pi / 2);
    summary(idx).theoretical_variance = ((4 - pi) / 2) * sigma ^ 2;

    subplot(1, numel(sigma_values), idx);
    histogram(samples, 50, 'Normalization', 'pdf');
    hold on;

    x_values = linspace(0, max(samples) * 1.05, 200);
    rayleigh_pdf = (x_values ./ sigma .^ 2) .* exp(-(x_values .^ 2) ./ (2 * sigma ^ 2));
    plot(x_values, rayleigh_pdf, 'r', 'LineWidth', 1.5);

    title(['Rayleigh 分布, \sigma = ', num2str(sigma)]);
    xlabel('x');
    ylabel('概率密度');
    legend('样本直方图', '理论 PDF', 'Location', 'northeast');
    grid on;
end

saveas(rayleigh_figure, fullfile(output_dir, 'task2_rayleigh.png'));

fprintf('任务2完成：Rayleigh 分布样本已生成。\n');
for idx = 1:numel(summary)
    fprintf('  sigma = %.1f: 样本均值 = %.4f，样本方差 = %.4f\n', ...
        summary(idx).sigma, summary(idx).sample_mean, summary(idx).sample_variance);
end
end
