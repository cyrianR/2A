function [X] = moindres_carres_ponderes(D_app, proba)

    n_app = size(D_app, 2);

    A = ones(n_app+1, 6);
    A(1:n_app,1) = (proba(1,:)').*(D_app(1,:)'.^2);
    A(1:n_app,2) = (proba(1,:)').*(D_app(1,:)'.*D_app(2,:)');
    A(1:n_app,3) = (proba(1,:)').*(D_app(2,:)'.^2);
    A(1:n_app,4) = (proba(1,:)').*(D_app(1,:)');
    A(1:n_app,5) = (proba(1,:)').*(D_app(2,:)');
    A(1:n_app,6) = proba(1,:)';
    A(n_app+1,2) = 0;
    A(n_app+1,4) = 0;
    A(n_app+1,5) = 0;
    A(n_app+1,6) = 0;

    B = zeros(n_app+1, 1);
    B(n_app+1) = 1;

    X = A \ B;

end

