clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

load force_externe;

% Parametres du modele :
% bon parametre pour tumeur : 0.01, 0.001
% bon parametres pour les fruits : 0.001, 0.0001
alpha = 0.001;				% Poids de la penalisation de la longueur
beta = 0.00001;				% Poids de la penalisation de la courbure

% Parametre de la descente de gradient :
% bon parametre pour tumeur : 0.2
% bon parametre pour les fruits : 0.5
gamma = 0.8;				% Pas de la descente de gradient
nb_iterations_max = 900000;		% Nombre d'iterations maximal
seuil_convergence = 1e-8;		% Critere d'arrêt sur l'ecart quadratique relatif entre deux affichages

% Parametres de la diffusion vers les contours (GVF)
% bon parametres pour les fruits : 0.01, 2, 300
% bon parametres pour la tumeur : 0.001, 0.0001, 300
gamma_gvf = 0.01;      % Pas de la descente de gradient du calcul des forces externes
mu_gvf = 2;            % Poids de pénalisation du gradient de la force 
max_iter = 300;        % Nombre d'iteration du calcul des forces externes

% Autres parametres :
N = 200;				% Nombre de points du contour actif
pas_affichage = 1000;			% Nombre d'iterations entre deux affichages

% Chargement de l'image
I = imread('contours_actifs_2.jpg');
%I = imread('coins.png');
%I = imread('IRM.png');
[nb_lignes,nb_colonnes,nb_canaux] = size(I);
if nb_canaux==3
	I = rgb2gray(I);
end
I = double(I);
I = I/max(I(:));
	
% Champ de force externe :
[Fx,Fy] = force_externe_gvf(I, max_iter, gamma_gvf, mu_gvf);

% Affichage de l'image a segmenter :
figure('Name','Segmentation par contour actif','Position',[0.1*L,0.1*H,0.9*L,0.7*H]);
subplot(1,2,1);
imagesc(I);
colormap gray;
axis image off;
hold on;

% Definition des points de controle :
fprintf('Definissez des points de controle par clics, puis tapez Entree !\n');
[x_P,y_P] = ginput;
plot(x_P,y_P,'r*','MarkerSize',10,'LineWidth',3);

% Coordonnees initiales (x0,y0) du contour actif par interpolation des points de contrôle :
x_P = [x_P ; x_P(1)];			% Duplication du premier point de controle
y_P = [y_P ; y_P(1)];			% Idem
nb_P = length(x_P);
xy_0 = interp1(1:nb_P,[x_P,y_P],1:(nb_P-1)/N:nb_P,'spline');
x_0 = xy_0(:,1);
y_0 = xy_0(:,2);

% Affichage du contour actif initial :
plot(x_0,y_0,'b-','LineWidth',2);
drawnow;
title('Iteration 0','FontSize',20);

% Calcul de la matrice A :
A = matrice_A(N,alpha,beta,gamma);

% evolution du contour actif :
x = x_0(1:end-1);
y = y_0(1:end-1);
x_precedent = x;
y_precedent = y;
convergence = 0;
ii = 1;
while ~convergence
	ii = ii+1;

	% Mise a jour du contour actif :
	[x,y] = iteration(x,y,Fx,Fy,gamma,A);
	
	% Affichage du contour actif courant, toutes les pas_affichage iterations :
	if mod(ii,pas_affichage)==1
		plot([x ; x(1)],[y ; y(1)],'b-','LineWidth',1);
		drawnow;
		title(['Iteration ' num2str(ii-1)],'FontSize',20);
				
		% Test de convergence (maximum de la difference relative inferieure a un seuil) :
		if max(((x-x_precedent).^2+(y-y_precedent).^2)./(x.^2+y.^2))<seuil_convergence
			convergence = 1;
		end		
		x_precedent = x;
		y_precedent = y;
	end
	
	if ii>nb_iterations_max
		convergence = 1;
	end
end

% Affichage du resultat :
subplot(1,2,2);
imagesc(I);
axis image off;
colormap gray;
hold on;
plot([x ; x(1)],[y ; y(1)],'r-','LineWidth',2);
title('Resultat de la segmentation','FontSize',20);
