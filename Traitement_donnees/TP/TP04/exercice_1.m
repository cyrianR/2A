clear;
close all;

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);


% Parametres :
N = 290;					% Nombre de disques d'une configuration
R = 7;					% Rayon des disques
nb_points_affichage_disque = 30;
increment_angulaire = 2*pi/nb_points_affichage_disque;
theta = 0:increment_angulaire:2*pi;
rose = [253 108 158]/255;
q_max = 50000;
nb_affichages = 1000;
pas_entre_affichages = floor(q_max/nb_affichages);
temps_pause = 0.0001;

% Lecture et affichage de l'image :
I = imread('colonie.png');
I = rgb2ycbcr(I);
I = double(I(:,:,1));
[nb_lignes,nb_colonnes] = size(I);
figure('Name',['Detection de ' num2str(N) ' flamants roses'],'Position',[0,0,L,0.58*H]);

% Tirage aleatoire d'une configuration initiale et calcul des niveaux de gris moyens :
c = zeros(N,2);
I_moyen = zeros(N,1);
for k = 1:N
    out = false;
    while ~out
        out = true;
	    c_k = [nb_colonnes*rand nb_lignes*rand];
        for i = 1:k-1
            if norm(c_k - c(i,:)) < 2*R % 2 au lieu de sqrt(2)
                out = false;
            end
        end
    end
    c(k,:) = c_k;
    I_moyen(k) = calcul_I_moyen(I,c_k,R);
end
liste_q = 0;
I_moyen_config = mean(I_moyen);
liste_I_moyen_config = I_moyen_config;

% Affichage de la configuration initiale :
subplot(1,2,1);
imagesc(I);
axis image;
axis off;
colormap gray;
hold on;
for i = 1:N
	x_affich = c(i,1)+R*cos(theta);
	y_affich = c(i,2)+R*sin(theta);
	indices = find(x_affich>0 & x_affich<nb_colonnes & y_affich>0 & y_affich<nb_lignes);
	plot(x_affich(indices),y_affich(indices),'Color',rose,'LineWidth',3);
end
pause(temps_pause);

% Courbe d'evolution du niveau de gris moyen :
subplot(1,2,2);
plot(liste_q,liste_I_moyen_config,'.','Color',rose);
axis([0 q_max 0 255]);
set(gca,'FontSize',20);
xlabel('Nombre d''iterations','FontSize',20);
ylabel('Niveau de gris moyen','FontSize',20);

% Recherche de la configuration optimale :
for q = 1:q_max
	i = rem(q,N)+1;					% On parcourt les N disques en boucle
	I_moyen_cour = I_moyen(i);

	% Tirage aleatoire d'un nouveau disque et calcul du niveau de gris moyen :
    out = false;
    while ~out
        out = true;
        c_alea = [nb_colonnes*rand nb_lignes*rand];
        for j = 1:N
            if norm(c_alea - c(j,:)) < 2*R % 2 au lieu de sqrt(2)
                out = false;
            end
        end
    end
	I_moyen_nouv = calcul_I_moyen(I,c_alea,R);

	% Si le disque propose est "meilleur", mises a jour :
	if I_moyen_nouv>I_moyen_cour
		c(i,:) = c_alea;
		I_moyen(i) = I_moyen_nouv;

		hold off;
		subplot(1,2,1);
		imagesc(I);
		axis image;
		axis off;
		colormap gray;
		hold on;
		for j = 1:N
			x_affich = c(j,1)+R*cos(theta);
			y_affich = c(j,2)+R*sin(theta);
			indices = find(x_affich>0 & x_affich<nb_colonnes & y_affich>0 & y_affich<nb_lignes);
			plot(x_affich(indices),y_affich(indices),'Color',rose,'LineWidth',3);
		end
		pause(temps_pause);
	end

	% Courbe d'evolution du niveau de gris moyen :
	if rem(q,pas_entre_affichages)==0
		liste_q = [liste_q q];
		I_moyen_config = mean(I_moyen);
		liste_I_moyen_config = [liste_I_moyen_config I_moyen_config];
		subplot(1,2,2);
		plot(liste_q,liste_I_moyen_config,'.-','Color',rose,'LineWidth',3);
		axis([0 q_max 0 255]);
		set(gca,'FontSize',20);
		xlabel('Nombre d''iterations','FontSize',20);
		ylabel('Niveau de gris moyen','FontSize',20);
	end
end
