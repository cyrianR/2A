function [probas] = probabilites_EM(D_app,parametres_estim,proportion_1,proportion_2,sigma)
    
    objective_1 = (proportion_1/sigma)*exp((-calcul_r(D_app, parametres_estim(1,:)).^2)/(2*sigma^2));
    objective_2 = (proportion_2/sigma)*exp((-calcul_r(D_app, parametres_estim(2,:)).^2)/(2*sigma^2));
    sum_objectives = objective_2 + objective_1;
    probas = [objective_1./sum_objectives; objective_2./sum_objectives];

end

