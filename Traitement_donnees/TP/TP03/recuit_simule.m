function [k_res] = recuit_simule(k,AD,beta,T)

    % sizes
    N = size(AD,3);
    n = size(AD,1);
    m = size(AD,2);

    % iterate over pixels in configuration
    for i = 1:n
        for j = 1:m
            % current class
            ks = k(i,j);

            % find random class k_new different than current class ks
            k_new = randi(N);
            while k_new == ks
                k_new = randi(N);
            end

            % compute local energies
            neighbors = k(max(1,i-1):min(n,i+1),max(0,j-1):min(m,j+1));
            Us = AD(i,j,ks) + beta*sum(1-(neighbors ~= ks), "all");
            Us_new = AD(i,j,k_new) + beta*(sum(1-(neighbors ~= k_new), "all")-1);

            % compare energies and update class
            if Us < Us_new
                k(i,j) = k_new;
            else

            end
            
        end

    end

    



end

