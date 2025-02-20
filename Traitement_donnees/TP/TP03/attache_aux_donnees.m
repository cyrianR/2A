function [AD] = attache_aux_donnees(I,moyennes,variances)

    N = size(moyennes,1);
    n = size(I,1);
    AD = ((repmat(I,[1,1,N]) - repmat(reshape(repmat(moyennes, [n,1]), [n, 1, N]), [1,n,1])).^2);
    sigma_square = repmat(reshape(repmat(variances.^2, [n,1]), [n, 1, N]), [1,n,1]);
    AD = 0.5.*(log(sigma_square) + (AD/sigma_square));
    % attention : ne fonctionne pas si image pas carrée

end

