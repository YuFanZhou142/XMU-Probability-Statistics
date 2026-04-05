function samples = generate_rayleigh_samples(sample_count, sigma)
%GENERATE_RAYLEIGH_SAMPLES Generate Rayleigh samples with inverse transform sampling.

if sample_count <= 0 || fix(sample_count) ~= sample_count
    error('sample_count must be a positive integer.');
end

if sigma <= 0
    error('sigma must be positive.');
end

uniform_samples = rand(1, sample_count);
uniform_samples = min(max(uniform_samples, eps), 1 - eps);
samples = sigma .* sqrt(-2 .* log(1 - uniform_samples));
end
