function [Y_modifie,taux_compression] = compression_naive(Y, valeurs_f, freq_coupure)

    Y_modifie = passe_bas(Y, valeurs_f, freq_coupure);

    taux_compression = 1 - (nnz(Y_modifie))/(nnz(Y));


end

