function [k] = recuit_simule(k,AD,beta,T)
    % Recuit simulé

    n = size(AD,1); % height
    m = size(AD,2); % width
    N = size(AD,3); % number of classes

    % iterate over pixels in configuration
    for i = 1:n
        for j = 1:m
            % current class
            ks = k(i,j);

            % random draw of class k_new different from current class ks
            k_new = randi(N);
            while k_new == ks
                k_new = randi(N);
            end

            % compute local energies
            neighbors = k(max(1,i-1):min(n,i+1),max(1,j-1):min(m,j+1));
            Us = AD(i,j,ks) + beta*(sum(neighbors ~= ks, "all")-1);
            Us_new = AD(i,j,k_new) + beta*(sum(neighbors ~= k_new, "all"));

            % compare energies and update class
            if Us_new < Us
                k(i,j) = k_new;
            else
                if rand() < exp(-(Us_new-Us)/T)
                    k(i,j) = k_new;
                end
            end
            
        end

    end
end

