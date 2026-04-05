function samples = generate_wichmann_hill(seed_values, sample_count)
%GENERATE_WICHMANN_HILL Generate U(0,1) samples with the Wichmann-Hill method.

if numel(seed_values) ~= 3
    error('seed_values must contain exactly three integers.');
end

if sample_count <= 0 || fix(sample_count) ~= sample_count
    error('sample_count must be a positive integer.');
end

state = double(seed_values(:).');
moduli = [30269, 30307, 30323];
multipliers = [171, 170, 172];

samples = zeros(1, sample_count);

for idx = 1:sample_count
    state = mod(multipliers .* state, moduli);
    samples(idx) = mod(sum(state ./ moduli), 1);
end
end
