function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'
    n = length(x);
    A = zeros(n,n);
    A(1:n, 1) = 1;
    for j = 1 : n
        A(1:n, j) = x(1:n) .^ (j - 1);
    end
    % TODO: Calculate the Vandermonde coefficients
    coef = inv(A) * y;
endfunction
