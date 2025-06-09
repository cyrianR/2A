function [u_kp1] = debruitage(b, u_k, lambda, Dx, Dy, epsilon)

    nb_pixels = size(u_k, 1);
    I = speye(nb_pixels);
    v = 1 ./ sqrt((Dx * u_k).^2 + (Dy * u_k).^2 + epsilon);
    W_k = spdiags(v, 0, nb_pixels, nb_pixels);
    A_k = I - lambda * (-Dx'*W_k*Dx - Dy'*W_k*Dy);
    u_kp1 = A_k \ b;

end

