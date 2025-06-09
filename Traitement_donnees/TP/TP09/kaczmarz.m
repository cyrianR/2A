function f = kaczmarz(p,W,n_boucles)

    n_mesures = size(p,1);
    n_pixels = size(W,2);

    W_t = transpose(W);
    W_norm_square = sum(W.^2,2);

    k_max = n_mesures * n_boucles;
    f_0 = zeros(n_pixels,1);

    f = f_0;
    for k = 1:k_max
        i = mod(k, n_mesures) + 1;
        if W_norm_square(i) ~= 0
            f = f + (W_t(:,i) * (p(i) - transpose(W_t(:,i))*f)) / W_norm_square(i);
        end
        
    end


end

