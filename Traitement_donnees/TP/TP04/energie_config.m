function [U_c] = energie_config(c, U, R, beta)

    N = size(c,1);

    somme_diracs = 0;
    for j = 1:N
        for i = 1:N
            if i < j
                % note : ici on utilise 2 au lieu de sqrt(2) du sujet car ça semble mieux 
                somme_diracs = somme_diracs + (norm(c(j,:)-c(i,:)) <= 2*R); 
            end
        end
    end

    U_c = sum(U) + beta * somme_diracs;

end

