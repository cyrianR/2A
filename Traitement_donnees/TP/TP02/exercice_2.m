clear;
close all;

load clusters;

% Affichage d'une image par individu de l'ensemble d'apprentissage :
figure('Name','Individus de EA','Position',[0.2*L,0.2*H,0.2*L,0.8*H]);
colormap gray;
for j = 1:n_ind
	img = reshape(X(:,(j-1)*n_pos+1),n_lig,n_col);
	subplot(n_ind,1,j);
	imagesc(img);
	axis image;
	axis off;
	title({['Individu numero ' num2str(numeros_individus(j))]},'FontSize',20);
end
drawnow;

% Tirage aleatoire d'une image de test :
individu = randi(15);
posture = randi(6);
fichier = [chemin '/i' num2str(individu,'%02d') num2str(posture,'%1d') '.mat'];
load(fichier);
img = eval(['i' num2str(individu,'%02d') num2str(posture,'%1d')]);

% Affichage de l'image de test :
figure('Name','Image tiree aleatoirement','Position',[0.4*L,0.2*H,0.6*L,0.5*H]);
colormap gray;
imagesc(img);
axis image;
axis off;

% il faut mettre double l'image tirée aléatoirement
