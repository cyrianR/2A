function f = retroprojection(sinogramme,theta,nb_rayons,nb_lignes,nb_colonnes)

    n_theta = size(theta,2);

    f = zeros(nb_lignes,nb_colonnes);
    t_0 = ceil(nb_rayons/2);

    for q = 1:n_theta
        teta_radian = theta(1,q) * pi / 180;
        for i = 1:nb_lignes
            for j = 1:nb_colonnes
                x = j - nb_colonnes/2;
                y = -i + nb_lignes/2;
                
                t = x*cos(teta_radian) + y*sin(teta_radian);
                f(i,j) = f(i,j) + sinogramme(t_0 + round(t), q);
            end
        end
    
    end
    f = f / n_theta;
end

