function Y_modifie = passe_bas(Y, valeurs_f, freq_coupure)

    
    i_coupure = 1;
    for i = 1:size(Y,1)
        if (abs(valeurs_f(i)-freq_coupure)) <= (abs(valeurs_f(i_coupure)-freq_coupure))
            i_coupure = i;
        end
    end

    Y_modifie = Y;
    Y_modifie(i_coupure:end,:) = 0;

end

