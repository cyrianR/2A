clear;
close all;

% Lecture de l'image u :
u = imread('Images/grille.png');
u = double(rgb2gray(u));
[nb_lignes,nb_colonnes, nb_canaux] = size(u);

% Calcul du spectre s de l'image u :
s = fft2(u);
s = fftshift(s);			% Permet de positionner l'origine (0,0) au centre

% Partition de s_u :
exemple = input('Pour effectuer la partition du spectre d''une grille, tapez 1, 2 ou 3 : ');
epaisseur = 10;
switch exemple
	case 1
		c_milieu = round(nb_colonnes/2);
		x = [c_milieu-epaisseur c_milieu-epaisseur c_milieu+epaisseur c_milieu+epaisseur];
		y = [1 nb_lignes nb_lignes 1];
        case 2
		l_milieu = round(nb_lignes/2);
		x = [1 nb_colonnes nb_colonnes 1];
		y = [l_milieu-epaisseur l_milieu-epaisseur l_milieu+epaisseur l_milieu+epaisseur];
	case 3
		epaisseur = sqrt(2)*epaisseur;
		x = [nb_colonnes-epaisseur nb_colonnes nb_colonnes epaisseur 1 1];
		y = [1 1 1+epaisseur nb_lignes nb_lignes nb_lignes-epaisseur];
end
selection = roipoly(s,x,y);

% Calcul du spectre filtre :
s_filtre = selection.*s;

% Calcul de l'image filtree :
u_filtre = real(ifft2(ifftshift(s_filtre)));

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Decomposition par modification du spectre','Position',[0.2*L,0,0.8*L,H]);

% Affichage des images u, u_filtre et u-u_filtre :
subplot(2,3,1);
affichage(u,'$x$','$y$','Image',nb_canaux);
subplot(2,3,2);
affichage(u_filtre,'$x$','$y$','Image filtree',nb_canaux);
subplot(2,3,3);
affichage(u-u_filtre,'$x$','$y$','Image complementaire',nb_canaux);

% Affichage du logarithme du module des spectres s, s_filtre et s-s_filtre :
subplot(2,3,4);
affichage(log(abs(s)),'$f_x$','$f_y$','Spectre',nb_canaux);
subplot(2,3,5);
affichage(log(abs(s_filtre)),'$f_x$','$f_y$','Spectre filtre',nb_canaux);
subplot(2,3,6);
affichage(log(abs(s-s_filtre)),'$f_x$','$f_y$','Spectre complementaire',nb_canaux);
