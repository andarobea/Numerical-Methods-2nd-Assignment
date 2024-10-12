function coef = spline_c2(x, y)
    % Number of intervals
    n = length(x) - 1;

    coef = zeros(4 * n, 1);

    a = y;  % vector a
    b = zeros(n, 1);
    c = zeros(n + 1, 1);
    d = zeros(n, 1);
    h = zeros(n, 1);
    for i = 2 : n + 1
        h(i - 1) = x(i) - x(i - 1);
    endfor

    H = zeros(n + 1, n + 1);
    H(1,1) = 1;
    H(n+1,n+1) = 1;
    sol = zeros(n + 1, 1);
    for i = 2 : n
        sol(i) = 3 * (a(i + 1) - a(i)) / h (i) - 3 * (a(i) - a(i - 1)) / h (i - 1);
        H(i, i - 1) = h(i - 1);
        H(i, i) = 2 * (h(i) + h(i - 1));
        H(i, i + 1) = h(i);
    endfor
    c = inv(H) * sol;
    for i = 1 : n
        d(i) = (c(i + 1) - c(i)) / (3 * h(i));
        b(i) = (a(i + 1) - a(i)) / h(i) - h(i) / 3 * (2 * c(i) + c(i + 1));
    endfor
    for i = 1 : 4 :  4*n
        coef(i) = a(ceil(i / 4));
        coef(i + 1) = b(ceil(i / 4));
        coef(i + 2) = c(ceil(i / 4));
        coef(i + 3) = d(ceil(i / 4));
    endfor
end
