function [existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T)

    % Taille de l'image
    [ni, nj] = size(D);

    % Initialisation des bornes du voisinage de p en le tronquant si
    % nécessaire
    if i_p-t <= 0
        bornes_V_p(1) = 1;
    else 
        bornes_V_p(1) = i_p-t;
    end
    if i_p+t > ni
        bornes_V_p(2) = ni;
    else 
        bornes_V_p(2) = i_p+t;
    end
    if j_p-t <= 0
        bornes_V_p(3) = 1;
    else 
        bornes_V_p(3) = j_p-t;
    end
    if j_p+t > nj
        bornes_V_p(4) = nj;
    else 
        bornes_V_p(4) = j_p+t;
    end

    % Bornes de la fenêtre de recherche
    bornes_F_p = [max(1,i_p-T), min(ni,i_p+T), max(1,j_p-T), min(nj,j_p+T)];
    
    % Initialisation des variables
    existe_q = false;
    bornes_V_p_final = bornes_V_p;
    bornes_V_q_chapeau = [0,0,0,0];
    min_dissemblance = +Inf;

    % Parcours des pixels q de la fenêtre F(p)
    for i_q = bornes_F_p(1):bornes_F_p(2)
        for j_q = bornes_F_p(3):bornes_F_p(4)

            % Bornes du voisinage V(q) de q, le pixel courant pris dans
            % la fenêtre F(p)
            bornes_V_q_courant = [max(i_q-(i_p-bornes_V_p(1)),1), ...
                    min(i_q+(bornes_V_p(2)-i_p),ni), ...
                    max(j_q-(j_p-bornes_V_p(3)),1), ...
                    min(j_q+(bornes_V_p(4)-j_p),nj)];

            % Vérifier que le voisinage de q ne se superpose pas au domaine D
            V_q_valide = true;
            for i_q_voisin = bornes_V_q_courant(1):bornes_V_q_courant(2)
                for j_q_voisin = bornes_V_q_courant(3):bornes_V_q_courant(4)
                    if D(i_q_voisin,j_q_voisin) ~= 0
                        V_q_valide = false;
                    end
                end
            end

            % Si le pixel q est dans la fenêtre et son voisinage est en
            % dehors de D, on peut le considérer
            if V_q_valide
                existe_q = true;

                % Indices relatifs (par rapport aux centres) de l'intersection des deux voisinage V(q) et V(p) superposés
                bornes_inter_relatif = [
                    -min(i_p-bornes_V_p(1),i_q-bornes_V_q_courant(1)), ...
                    min(bornes_V_p(2)-i_p,bornes_V_q_courant(2)-i_q), ...
                    -min(j_p-bornes_V_p(3),j_q-bornes_V_q_courant(3)), ...
                    min(bornes_V_p(4)-j_p,bornes_V_q_courant(4)-j_q)
                    ];

                dissemblance = 0;
                for i = bornes_inter_relatif(1):bornes_inter_relatif(2)
                    for j = bornes_inter_relatif(3):bornes_inter_relatif(4)
                        if D(i_q+i,j_q+j) == 0 && D(i_p+i,j_p+j) == 0
                            dissemblance = dissemblance + norm(reshape(u_k(i_q+i,j_q+j,:),[1, 3]) - reshape(u_k(i_p+i,j_p+j,:),[1, 3]))^2;
                        end
                    end
                end

                if dissemblance < min_dissemblance
                    min_dissemblance = dissemblance;
                    bornes_V_q_chapeau = bornes_V_q_courant;

                    % Mettre à jour les bornes du voisinage V(p) comme étant l'intersection
                    % des deux voisinage V(q) et V(p) superposés (si
                    % jamais l'un des deux voisinage aurait dû être
                    % tronqué)
                    bornes_V_p_inter = [
                    i_p+bornes_inter_relatif(1), ...
                    i_p+bornes_inter_relatif(2), ...
                    j_p+bornes_inter_relatif(3), ...
                    j_p+bornes_inter_relatif(4)
                    ];
                    bornes_V_p_final = bornes_V_p_inter;
                end
            end
        end
    end

    bornes_V_p = bornes_V_p_final;

end

