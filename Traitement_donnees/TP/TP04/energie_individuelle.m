function [U] = energie_individuelle(c, I, R, gamma, S)

    U = 1 - (2 / (1 + exp(-gamma*((calcul_I_moyen(I,c,R)/S) - 1)))) ;

end

