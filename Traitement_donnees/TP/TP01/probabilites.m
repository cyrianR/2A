function [probas] = probabilites(D_app,parametres_estim,sigma)

    probas = [(0.5/sigma)*exp((-calcul_r(D_app, parametres_estim(1,:)).^2)/(2*sigma^2));
        (0.5/sigma)*exp((-calcul_r(D_app, parametres_estim(2,:)).^2)/(2*sigma^2))];

end

