function density = normal_pdf_local(x_values, mu, sigma)
%NORMAL_PDF_LOCAL Evaluate the Gaussian probability density without toolbox dependencies.

if sigma <= 0
    error('sigma must be positive.');
end

density = 1 ./ (sigma .* sqrt(2 .* pi)) .* exp(-0.5 .* ((x_values - mu) ./ sigma) .^ 2);
end
