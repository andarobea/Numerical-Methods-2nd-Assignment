function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients
	y_interp = zeros(length(x_interp), 1);
	n = length(coef);
    for i = 1 : length(x_interp)
		for j = 1 : n
			y_interp(i) += coef(j) * x_interp(i) .^ (j - 1);
		end
    end
end
