function samples = generate_discrete_samples(values, probabilities, sample_count)
%GENERATE_DISCRETE_SAMPLES Generate discrete samples from a given probability mass function.

if numel(values) ~= numel(probabilities)
    error('values and probabilities must have the same length.');
end

if sample_count <= 0 || fix(sample_count) ~= sample_count
    error('sample_count must be a positive integer.');
end

probabilities = probabilities(:).';
values = values(:).';

if any(probabilities < 0)
    error('probabilities must be non-negative.');
end

if abs(sum(probabilities) - 1) > 1e-10
    error('probabilities must sum to 1.');
end

cdf_values = cumsum(probabilities);
uniform_samples = rand(1, sample_count);
samples = zeros(1, sample_count);

for idx = 1:sample_count
    sample_index = find(uniform_samples(idx) <= cdf_values, 1, 'first');
    samples(idx) = values(sample_index);
end
end
