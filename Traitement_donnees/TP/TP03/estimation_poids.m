function [poids, argument] = estimation_poids(mu_test,sigma_test,liste_nvg,F)
    % Estimation des poids par résolution d'équations linéaires

    N = size(mu_test,2); % nombre de classes
    A = zeros(size(liste_nvg,2), N);

    for x = 1:size(liste_nvg,2)
        A(x,:) = exp(-((x-mu_test).^2) ./ (2.*(sigma_test.^2))) ./ (sqrt(2*pi).*sigma_test);
    end

    poids = A\F';
    argument = sum((F' - A*poids).^2);

end

