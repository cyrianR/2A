function [Fx,Fy] = force_externe_gvf(I, max_iter, gamma_gvf, mu_gvf)

    % Champ de force externe initiale (sans filtrage gaussien)
    [Ix,Iy] = gradient(I);
    Eext = -(Ix.*Ix+Iy.*Iy);
    [Fx0,Fy0] = gradient(Eext);

    % Norme force externe initiale
    norm_DE_ext0 = sum(Fx0.*Fx0) + sum(Fy0.*Fy0);

    % Calcul du champs de force externe GVF
    convergence = 0;
    it = 1;
    Fx = Fx0;
    Fy = Fy0;
    while ~convergence
	    it = it+1;

        Fx = Fx - gamma_gvf.*(norm_DE_ext0.*(Fx-Fx0) - mu_gvf.*del2(Fx));
        Fy = Fy - gamma_gvf.*(norm_DE_ext0.*(Fy-Fy0) - mu_gvf.*del2(Fy));

        if it > max_iter
		    convergence = 1;
	    end
    end


end

