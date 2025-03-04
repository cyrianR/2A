function [AD] = attache_aux_donnees(I,moyennes,variances)

    N = size(variances,2);
    [n, m] = size(I);
    
    AD = zeros(n,m,N);
    for i = 1:n
        for j = 1:m
            for k = 1:N
                AD(i,j,k) = 0.5*((log(variances(k)) + (I(i,j) - moyennes(k)).^2) ./ (variances(k)));
            end
        end
    end

    % autre version, ne fonctionne qu'avec I carrée
    % AD = ((repmat(I,[1,1,N]) - repmat(reshape(repmat(moyennes, [n,1]), [n, 1, N]), [1,n,1])).^2);
    % var = repmat(reshape(repmat(variances, [n,1]), [n, 1, N]), [1,n,1]);
    % AD = 0.5.*(log(var) + (AD./var));

end

