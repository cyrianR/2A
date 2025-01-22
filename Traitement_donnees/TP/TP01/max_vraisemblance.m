function [param_min] = max_vraisemblance(D_app,parametres_test)

    param_min = parametres_test(1,:);
    log_v_min = inf;
    for i = 1:length(parametres_test)
        distances_carre = calcul_r(D_app, parametres_test(i,:)).^2;
        log_v = sum(distances_carre);
        if log_v < log_v_min
            log_v_min = log_v;
            param_min = parametres_test(i,:);
        end
    end

end

