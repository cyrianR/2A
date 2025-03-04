function [poids, argument] = estimation_poids(mu_test,sigma_test,liste_nvg,F)
    % Estimation des poids par résolution d'équations linéaires

    N = size(mu_test,2); % nombre de classes
    A = zeros(256, N);

    for i = 1:N
        A(:,i) = exp(-((liste_nvg'-mu_test(i)).^2) ./ (2.*(sigma_test(i).^2))) ./ (sqrt(2*pi).*sigma_test(i));
    end

    poids = A\F';
    argument = sum(F' - A*poids);

end

