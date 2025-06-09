function paires = appariement(pics_t, pics_f, n_v, delta_t, delta_f)

    paires = [];

    for i = 1:size(pics_t, 1)
        distances_m = pics_t - pics_t(i);
        distances_k = abs(pics_f - pics_f(i));

        voisins_indices = find(distances_m > 0 & distances_m < delta_t & distances_k < delta_f, n_v);

        voisins_m = pics_f(voisins_indices);
        voisins_k = pics_t(voisins_indices);

        for j = 1:
            
        end


    end

end

