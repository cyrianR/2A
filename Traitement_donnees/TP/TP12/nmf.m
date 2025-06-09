function [D,A] = nmf(Y, D_0, A_0, n_iter)

    A = A_0;
    D = D_0;
    for k = 1:n_iter
        A = A .* (D' * Y) ./ ((D' * D * A) + ones(size(D,2),size(A,2))*0.01);
        D = D .* (Y * A') ./ ((D * A * A') + ones(size(D,1),size(A,1))*0.01);

        for i = 1:size(D,2)
            m = max(D(:,i));
            D(:,i) = D(:,i) / m;
            A(i,:) = A(i,:) * m;
        end
    end

end

