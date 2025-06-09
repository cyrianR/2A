function [y] = gauss(x, mean, sigma, n)

    y = exp( - ((x - mean)/sigma).^n );

end

