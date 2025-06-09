function [Y_modifie,taux_compression] = compression(Y, m_coeff_max)

    [~, indices_max] = maxk(abs(Y),m_coeff_max);
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

