function A = matrice_A(N,alpha,beta,gamma)

    % construction de D2 : approximation discrète de la dérivée seconde
    v = ones(1,N-1);
    D2 = -2*eye(N) + diag(v,1) + diag(v,-1);
    D2(1,N) = 1;
    D2(N,1) = 1;
    
    A = eye(N) + gamma * (alpha*D2 - beta*(D2')*D2);

end

