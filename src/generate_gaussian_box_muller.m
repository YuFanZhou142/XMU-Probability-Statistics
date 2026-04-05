function samples = generate_gaussian_box_muller(sample_count, mu, sigma)
%GENERATE_GAUSSIAN_BOX_MULLER Generate Gaussian samples with the Box-Muller transform.

if sample_count <= 0 || fix(sample_count) ~= sample_count
    error('sample_count must be a positive integer.');
end

if sigma <= 0
    error('sigma must be positive.');
end

uniform_samples_1 = max(rand(1, sample_count), eps);
uniform_samples_2 = rand(1, sample_count);

radius = sqrt(-2 .* log(uniform_samples_1));
theta = 2 .* pi .* uniform_samples_2;

standard_normal_samples = radius .* cos(theta);
samples = mu + sigma .* standard_normal_samples;
end
