function y_interp = P_spline(coef, x, x_interp)
    % si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
    % coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
    % x = [x0, x1, ..., xn]
    % y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
    % Be careful! Indexes in Octave start from 1, not 0

    % Number of intervals
    n = length(x) - 1;

    % Initialize y_interp
    y_interp = zeros(size(x_interp));

    % Calculate y_interp using the Spline coefficients
    for k = 1:length(x_interp)
        % Find the interval where x_interp(k) lies
        idx = find(x_interp(k) >= x, 1, 'last');

        % Ensure idx is within bounds
        if isempty(idx)
            idx = 1;
        elseif idx == n+1
            idx = n;
        end
        % Compute the spline polynomial for the interval idx
        y_interp(k) = coef(4*idx-3) + coef(4*idx-2) * (x_interp(k) - x(idx)) + coef(4*idx-1) * (x_interp(k) - x(idx))^2 + coef(4*idx) * (x_interp(k) - x(idx))^3;
    end
end
