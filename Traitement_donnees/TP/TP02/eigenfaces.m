function W = eigenfaces(X_c)
    n = size(X_c,2);
    sigma = (X_c' * X_c) / n;
    [V,D] = eig(sigma);
    [~,sortIdx] = sort(diag(D),'descend');
    V_sorted = V(:,sortIdx);
    X_c_sorted = X_c(:,sortIdx);
    W = X_c_sorted * V_sorted(:,1:n-1);
    W_norms = sqrt(sum(W.^2,1));
    W = W./repmat(W_norms,size(X_c,1),1);
end

