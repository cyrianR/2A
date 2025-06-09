function [new_u_k,new_D] = rapiecage(bornes_V_p,bornes_V_q_chapeau,u_k,D)

    new_D = D;

    new_V_p = u_k(bornes_V_q_chapeau(1):bornes_V_q_chapeau(2),bornes_V_q_chapeau(3):bornes_V_q_chapeau(4),:);
    for i = bornes_V_p(1):bornes_V_p(2)
        for j = bornes_V_p(3):bornes_V_p(4)
            if D(i,j) == 0
                i_local = i - bornes_V_p(1) + 1;
                j_local = j - bornes_V_p(3) + 1;
                new_V_p(i_local,j_local,:) = u_k(i,j,:);
            else
                new_D(i,j) = 0;
            end
        end
    end

    new_u_k = u_k;
    new_u_k(bornes_V_p(1):bornes_V_p(2),bornes_V_p(3):bornes_V_p(4),:) = new_V_p;

end

