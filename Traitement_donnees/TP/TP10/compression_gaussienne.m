function [Y_modifie,taux_compression] = compression_gaussienne(Y, m_coeff_max, f_ech, N)

    % distribution gaussienne et réhaussement
    mu = 2000; % mean
    sigma = 1000; % standard deviation
    frequences = (1:length(Y))*f_ech/N; % fréquences
    exp = 2;
    gaussian = gauss(frequences, mu, sigma, exp) * (1/gauss(sigma, mu, sigma, exp));
    Y_gaussian = Y .* repmat(gaussian', 1, size(Y,2)); 

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

