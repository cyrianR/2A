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


% calcul des 3 composantes principales de la donnée de test
test_centre = double(img(:)) - X_moyen;
C_test = transpose(test_centre)*W;
C_3_test = C_test(:,1:3);

% recherche de l'individu et de la distance minimums
dist_minimum = inf;
individu_min_indice = 1;
for j = 1:n_ind
	indices = (j-1)*n_pos+1:j*n_pos;
    m = mean(C_3(indices,:));
    dist = norm(m-C_3_test);
    if dist <= dist_minimum
        dist_minimum = dist;
        individu_min_indice = j;
    end
end

% detection de l'individu test
% retourne son numéro si il appartient aux individus connus et rien sinon
seuil = 0.3;
moy_glob = mean(C_3);
dist_moy_glob = norm(moy_glob-C_3_test);
if dist_minimum / (dist_minimum + dist_moy_glob) < seuil
    disp("L'individu est connu, c'est : ");
    disp(numeros_individus(individu_min_indice));
else 
    disp("L'individu n'est pas connu.");
end

