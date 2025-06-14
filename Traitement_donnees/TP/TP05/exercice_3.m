%--------------------------------------------------------------------------
% ENSEEIHT - 2SN MM - Traitement des donnees audio-visuelles
% TP5 - Restauration d'images
% exercice_3 : inpainting par rapie�cage (domaine D connu)
%--------------------------------------------------------------------------

clear
close all
clc

% Mise en place de la figure pour affichage :
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Inpainting par rapiecage',...
	'Position',[0.06*L,0.1*H,0.9*L,0.75*H])

% Lecture de l'image :
u_0 = double(imread('Images/randonneur.jpg'));
[nb_lignes,nb_colonnes,nb_canaux] = size(u_0);
u_max = max(u_0(:));

% Affichage de l'image :
subplot(1,2,1)
	imagesc(max(0,min(1,u_0/u_max)),[0 1])
	axis image off
	title('Image originale','FontSize',20)
	if nb_canaux == 1
		colormap gray
	end

% Lecture du domaine a restaurer :
D = imread('Images/masque_randonneur.png') > 0;

% Affichage de l'image resultat :
u_k = u_0;
for c = 1:nb_canaux
	u_k(:,:,c) = (~D).*u_k(:,:,c);	
end
subplot(1,2,2)
	imagesc(max(0,min(1,u_k/u_max)),[0 1])
	axis image off
	title('Image resultat','FontSize',20)
	if nb_canaux == 1
		colormap gray
	end
drawnow nocallbacks

% Lancement du traitement :
fprintf('Tapez un caractere pour lancer le traitement !\n');
pause

% Initialisation de la frontiere de D :
delta_D = frontiere(D);
indices_delta_D = find(delta_D > 0);
nb_points_delta_D = length(indices_delta_D);

% Parametres :
t = 9;			% Voisinage d'un pixel de taille (2t+1) x (2t+1)
T = 50;			% Fen�etre de recherche de taille (2T+1) x (2T+1)

tic

iter = 1;
% Tant que la frontiere de D n'est pas vide :
while nb_points_delta_D > 0

    disp(['Iteration: ', num2str(iter)]);
    iter = iter + 1;

	% Pixel p de la frontiere de D tire aleatoirement :
	indice_p = indices_delta_D(randi(nb_points_delta_D));
	[i_p,j_p] = ind2sub(size(D),indice_p);

	% Recherche du pixel q_chapeau :
	[existe_q,bornes_V_p,bornes_V_q_chapeau] = d_min(i_p,j_p,u_k,D,t,T);

	% S'il existe au moins un pixel q eligible :
	if existe_q

		% Rapie�age et mise a jour de D :
		[u_k,D] = rapiecage(bornes_V_p,bornes_V_q_chapeau,u_k,D);

		% Mise a jour de la frontiere de D :
		delta_D = frontiere(D);
		indices_delta_D = find(delta_D > 0);
		nb_points_delta_D = length(indices_delta_D);

		% Affichage de l'image resultat :
        for c = 1:nb_canaux
	        u_k(:,:,c) = (~D).*u_k(:,:,c);	
        end
		subplot(1,2,2)
		imagesc(max(0,min(1,u_k/u_max)),[0 1])
		axis image off
		title('Image resultat','FontSize',20)
		if nb_canaux == 1
			colormap gray
		end
		drawnow nocallbacks
	end
end

temps_calcul = toc;
fprintf('Temps de calcul : %.2f secondes\n', temps_calcul);

% Sauvegarde de l'image restauree
u_k_save = uint8(max(0, min(1, u_k / u_max)) * 255);  % Normalisation et conversion

% Si image en niveaux de gris (1 canal), convertir en 2D
if nb_canaux == 1
    imwrite(u_k_save(:,:,1), 'Resultats/rapiecage.png');
else
    imwrite(u_k_save, 'Resultats/rapiecage.png');
end
