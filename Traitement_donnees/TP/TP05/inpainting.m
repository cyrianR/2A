function [u_kp1] = inpainting(W, b, u_k, lambda, Dx, Dy, epsilon)

    nb_pixels = size(u_k, 1);
    v = 1 ./ sqrt((Dx * u_k).^2 + (Dy * u_k).^2 + epsilon);
    W_k = spdiags(v, 0, nb_pixels, nb_pixels);
    A_k = W - lambda * (-Dx'*W_k*Dx - Dy'*W_k*Dy);
    u_kp1 = A_k \ b;

end

