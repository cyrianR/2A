function [Y_modifie,taux_compression] = compression_gaussienne_2(Y, m_coeff_max)

    % distribution gaussienne et réhaussement
    mu = 2000; % mean
    sigma = 1000; % standard deviation
    Y_gaussian = normpdf(Y, mu, sigma) * (1/normpdf(sigma, mu, sigma));

    % on garde les m_coeff_max plus fortes valeurs dans chaque colonnes de abs(Y_gaussian)
    [~, indices_max] = maxk(abs(Y_gaussian),m_coeff_max);
    indices_zeros = zeros(size(Y));
    for col = 1:size(Y,2)
        for i = 1:size(indices_max,1)
            ind_max = indices_max(i,col);
            indices_zeros(ind_max, col) = 1;
        end
    end
    Y_modifie = Y.*indices_zeros;

    taux_compression = 1 - (nnz(Y_modifie))/(nnz(Y));

end

