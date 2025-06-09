clear;
close all;

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);


% Parametres :
beta = 1;               % coeff energie
S = 140;                % coeff sigmoide
gamma = 5;              % coeff sigmoide
T_0 = 0.1;              % température initiale
lambda_0 = 100;         % taux de naissance initial
alpha = 0.995;          % coefficient de décroissement
R = 7;					% Rayon des disques
nb_points_affichage_disque = 30;
increment_angulaire = 2*pi/nb_points_affichage_disque;
theta = 0:increment_angulaire:2*pi;
rose = [253 108 158]/255;
q_max = 300;
nb_affichages = 10;
pas_entre_affichages = floor(q_max/nb_affichages);
temps_pause = 0.0001;

% Lecture et affichage de l'image :
I = imread('colonie.png');
I = rgb2ycbcr(I);
I = double(I(:,:,1));
[nb_lignes,nb_colonnes] = size(I);
figure('Name',['Detection de flamants roses'],'Position',[0,0,L,0.58*H]);

% Courbe d'evolution de l'energie de la configuration courante :
liste_q = 0;
liste_energie = 0;
subplot(1,2,2);
plot(liste_q,liste_energie,'.','Color',rose);
axis([0 q_max -400 0]);
set(gca,'FontSize',20);
xlabel('Nombre d''iterations','FontSize',20);
ylabel('Energie de la configuration courante','FontSize',20);

T = T_0;
lambda = lambda_0;
c = [];              % configuration initiale vide
U = [];              % energies de chaque disque de la configuration
N = 0;               % nombre de disques de la configuration
% Recherche de la configuration optimale :
for q = 1:q_max
    
    % Naissance
    N_nouveaux_disques = poissrnd(lambda);
    for i = 1:N_nouveaux_disques
        c_alea = [nb_colonnes*rand nb_lignes*rand];
        U_i = energie_individuelle(c_alea, I, R, gamma, S);
        c = [c; c_alea];
        U = [U U_i];
    end

    % Tri des disques par valeur décroissante de leurs énergies
    [U_tri, indices_tri] = sort(U, 'descend');
    c_tri = c(indices_tri,:);
    c = c_tri;
    U = U_tri;

    % Morts
    U_c = energie_config(c, U, R, beta); % energie config courante
    taille_c = size(c,1);
    i = 1;
    while i <= taille_c
        c_sans_c_i = c;
        c_sans_c_i(i,:) = [];
        U_sans_U_i = U;
        U_sans_U_i(i) = [];
        U_c_sans_c_i = energie_config(c_sans_c_i, U_sans_U_i, R, beta);
        % proba de c_i sachant c
        p = lambda / (lambda + exp((U_c_sans_c_i - U_c) / T));
        if rand() < p
            U_c = U_c_sans_c_i; % maj energie de config courante
            U = U_sans_U_i; % maj energies individuelles
            c = c_sans_c_i; % maj config courante
            taille_c = taille_c - 1;
        else
            i = i + 1;
        end
    end

    % Mise à jour du nombre de disques dans la configuration
    N = size(c,1);

    % Si convergence atteinte, stopper la boucle (convergence =
    % configuration identique après étape de morts)
    convergence = false; % cette convergence n'a pas encore été implémentée
    if convergence
        break;
    else
        T = alpha * T;
        lambda = alpha * lambda;
    end

    % Affichage configuration courante
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

    % Courbe d'evolution de l'energie de la configuration courante :
    if rem(q, pas_entre_affichages) == 0
		liste_q = [liste_q q];
		liste_energie = [liste_energie U_c];
		subplot(1,2,2);
		plot(liste_q,liste_energie,'.-','Color',rose,'LineWidth',3);
		axis([0 q_max -400 0]);
		set(gca,'FontSize',20);
		xlabel('Nombre d''iterations','FontSize',20);
        ylabel('Energie de la configuration courante','FontSize',20);
    end
	
end

disp('');
disp('---------------------- RESULTAT ----------------------');
disp('');
disp(['Nombre de flamants roses trouvés : ', num2str(N)]);
disp('');
disp('------------------------------------------------------');

