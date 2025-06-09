clear;
close all;

% Lecture de l'image u :
u = double(imread('Images/Lena.jpg'));
uR = u(:,:,1);
uG = u(:,:,2);
uB = u(:,:,3);
[nb_lignes,nb_colonnes, nb_canaux] = size(u);

% Calcul du spectre s de l'image u :
sR = fft2(uR);
sG = fft2(uG);
sB = fft2(uB);
sR = fftshift(sR);
sG = fftshift(sG);
sB = fftshift(sB);
s = zeros(nb_lignes, nb_colonnes, 3);
s(:,:,1) = sR;
s(:,:,2) = sG;
s(:,:,3) = sB;

% Partition de s_u :
seuil_freq = 0.04;
[f_x, f_y] = meshgrid(1:nb_colonnes, 1:nb_lignes); % grid of image size
f_x = f_x/nb_colonnes-0.5;
f_y = f_y/nb_lignes-0.5;
selection = f_x.^2 + f_y.^2 <= seuil_freq^2; % circle

% pondérer le spectre
seuil_ponderation = 0.001;
ponderation = 1 ./ (1 + ((f_x.^2 + f_y.^2) / seuil_ponderation));
s = ponderation.*s;

% Calcul du spectre filtre :
sR_filtre = selection.*sR;
sG_filtre = selection.*sG;
sB_filtre = selection.*sB;
s_filtre = zeros(nb_lignes, nb_colonnes, 3);
s_filtre(:,:,1) = sR_filtre;
s_filtre(:,:,2) = sG_filtre;
s_filtre(:,:,3) = sB_filtre;

% Calcul de l'image filtree :
uR_filtre = real(ifft2(ifftshift(sR_filtre)));
uG_filtre = real(ifft2(ifftshift(sG_filtre)));
uB_filtre = real(ifft2(ifftshift(sB_filtre)));
u_filtre = zeros(nb_lignes, nb_colonnes, 3);
u_filtre(:,:,1) = uR_filtre;
u_filtre(:,:,2) = uG_filtre;
u_filtre(:,:,3) = uB_filtre;

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Decomposition par modification du spectre pour image couleur', ...
	'Position',[0.06*L,0.1*H,0.9*L,0.7*H])

% Affichage de l'image :
subplot(1,3,1)
u_max = max(u(:));
imagesc(max(0,min(1,u/u_max)),[0 1])
if nb_canaux==1
	colormap gray
end
axis image off
title('Image originale','FontSize',20)

subplot(1,3,2)
u_filtre_max = max(u_filtre(:));
imagesc(max(0,min(1,u_filtre/u_filtre_max)),[0 1])
if nb_canaux==1
	colormap gray
end
axis image off
title('Structure','FontSize',20)

subplot(1,3,3)
uu = u-u_filtre;
uu_max = max(uu(:));
imagesc(max(0,min(1,uu/uu_max)),[0 1])
if nb_canaux==1
	colormap gray
end
axis image off
title('Texture','FontSize',20)
