function [X] = moindres_carres(D_app)

    n_app = length(D_app);

    A = ones(n_app+1, 6);
    A(1:n_app,1) = D_app(1,:).'.^2;
    A(1:n_app,2) = D_app(1,:).'.*D_app(2,:).';
    A(1:n_app,3) = D_app(2,:).'.^2;
    A(1:n_app,4) = D_app(1,:).';
    A(1:n_app,5) = D_app(2,:).';
    A(n_app+1,2) = 0;
    A(n_app+1,4) = 0;
    A(n_app+1,5) = 0;
    A(n_app+1,6) = 0;

    B = zeros(n_app+1, 1);
    B(n_app+1) = 1;

    X = A \ B;

end

