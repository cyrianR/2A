function u = collage(r,s,interieur,mixed_gradient)

[nb_lignes,nb_colonnes,nb_canaux] = size(r);
nb_pixels = nb_lignes*nb_colonnes;

u = zeros(nb_lignes,nb_colonnes,3);

r = double(r);
s = double(s);

% operateur laplacien / calcul de A
e = ones(nb_pixels,1);
Dx = spdiags([-e e],[0 nb_lignes],nb_pixels,nb_pixels);
Dx(end-nb_lignes+1:end,:) = 0;
Dy = spdiags([-e e],[0 1],nb_pixels,nb_pixels);
Dy(nb_lignes:nb_lignes:end,:) = 0;
A = Dx'*Dx + Dy'*Dy;

% conditions aux bords pour A
bord_r = zeros(nb_lignes,nb_colonnes);
bord_r(1,:) = repmat(1,1,nb_colonnes);
bord_r(nb_lignes,:) = repmat(1,1,nb_colonnes);
bord_r(:,1) = repmat(1,nb_lignes,1);
bord_r(:,nb_colonnes) = repmat(1,nb_lignes,1);
indices_bord_r = find(bord_r);
n_bord_r = size(indices_bord_r,1);
A(indices_bord_r,:) = sparse(1:n_bord_r,indices_bord_r,ones(n_bord_r,1),n_bord_r,nb_pixels);

for k=1:nb_canaux
    rk = reshape(r(:,:,k),[nb_pixels, 1]);
    sk = reshape(s(:,:,k),[nb_pixels, 1]);

    % calcul de gk, le champs guidé (noté v dans le cours)
    grad_rk = [Dx * rk , Dy * rk];
    grad_sk = [Dx * sk , Dy * sk];
    gk = grad_rk;
    if mixed_gradient
        fort_grad_x = intersect(find(abs(grad_rk(:,1)) < abs(grad_sk(:,1))), interieur);
        fort_grad_y = intersect(find(abs(grad_rk(:,2)) < abs(grad_sk(:,2))), interieur);
        gk(fort_grad_x,1) = grad_sk(fort_grad_x,1);
        gk(fort_grad_y,2) = grad_sk(fort_grad_y,2);
    else
        gk(interieur,:) = grad_sk(interieur,:);
    end

    % calcul de bk (divergence de gk)
    bk = Dx' * gk(:,1) + Dy' * gk(:,2);

    % conditions aux bords de bk
    bk(indices_bord_r) = rk(indices_bord_r);

    % résolution de uk
    uk = A \ bk;

    u(:,:,k) = reshape(uk,[nb_lignes,nb_colonnes]);
end

