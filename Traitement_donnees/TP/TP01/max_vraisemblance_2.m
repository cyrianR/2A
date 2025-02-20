function [param_max] = max_vraisemblance_2(D_app,parametres_test,sigma)

    param_max = parametres_test(1,:,:);
    log_v_max = -inf;
    for i = 1:size(parametres_test, 1)
        r_1_square = calcul_r(D_app, parametres_test(i,1,:)).^2;
        r_2_square = calcul_r(D_app, parametres_test(i,2,:)).^2;
        % on connnait pi_1 = pi_2 et sigma donc on peut sortir le
        % ln(pi/sigma) et c'est une constante donc n'intervient pas dans la
        % maximisation
        term_under_sum = log(exp((-1).*r_1_square./(2*sigma^2)) + exp((-1).*r_2_square./(2*sigma^2)));
        log_v = sum(term_under_sum);
        if log_v > log_v_max
            log_v_max = log_v;
            param_max = parametres_test(i,:,:);
        end
    end

end

