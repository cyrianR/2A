function [y_modifie] = etirement_temporel(y, proportion)

    % Calcul TFCT
    N = 2048;					    % Nombre d'échantillons de la fenêtre
    D = 512;				     	% Nombre d'échantillons entre positions successives de la fenêtre
    fenetre = 'hann';				% Type de la fenêtre : 'rect' ou 'hann'
    Y = TFCT(y, N, D, fenetre);

    % Temps de contrôle pour l'interpolation (colonnes d'origines)
    C = 1:proportion:size(Y,2);

    % Phase première colonne
    phi = angle(Y(:,1));

    % Etirement
    Y_modifie = zeros(size(Y,1), length(C));
    for i = 1:length(C)
        c = floor(C(i));
        alpha = C(i) - c;
        if c+1 <= 855
            rho = (1-alpha)*abs(Y(:,c)) + alpha*abs(Y(:,c+1));
            d_phi = angle(Y(:,c+1)) - angle(Y(:,c));
        else
            rho = (1-alpha)*abs(Y(:,c)) + alpha*abs(Y(:,c));
            d_phi = angle(Y(:,c)) - angle(Y(:,c));
        end
        Y_modifie(:,i) = rho.*exp(1i*phi);
        phi = phi + d_phi;
    end

    % Calcul ITFCT
    y_modifie = ITFCT(Y_modifie, N, D, fenetre);

end

