clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'un fichier audio :
[y, f_ech] = audioread('Audio/overworld.wav');
y = mean(y, 2);

% Affichage du signal original, en guise de comparaison :
figure(Name='Modification du signal', Position=[0,0,L,0.6*H]);
subplot(2,1,1);
plot((0:length(y) - 1) / f_ech, y)
ylim([-1 1])
set(gca, FontSize=20);
xlabel('Temps ($s$)', Interpreter='Latex', FontSize=30);
ylabel('Frequence ($Hz$)', Interpreter='Latex', FontSize=30);
title('Signal original','FontSize',20);

% Ajout d'un effet :
%y_modifie = changement_vitesse(y, f_ech, 2);		% Paramètre à faire varier entre 0.8 et 1.5
%y_modifie = etirement_temporel(y, 2);		        % Paramètre à faire varier entre 0.8 et 1.4
y_modifie = transposition(y, f_ech, 1.5);		    % Paramètre à faire varier entre 0.9 et 1.1

% Gestion des limites de l'axe temporel :
% (une fonction qui permet d'avoir les mêmes limites pour les subplots ?)
duree_y = length(y) / f_ech;
duree_y_modifie = length(y_modifie) / f_ech;
xlim([0 max([duree_y, duree_y_modifie])])

% Affichage du signal modifié :
subplot(2,1,2);
plot((0:length(y_modifie) - 1) / f_ech, y_modifie)
xlim([0 max([duree_y, duree_y_modifie])])
ylim([-1 1])
set(gca, FontSize=20);
xlabel('Temps ($s$)', Interpreter='Latex', FontSize=30);
ylabel('Frequence ($Hz$)', Interpreter='Latex', FontSize=30);
title('Signal modifié', FontSize=20);
drawnow;

% Lecture :
player = audioplayer(y_modifie, f_ech);

% Animation :
h = xline(0,'LineWidth',3,'Color','r');
player.TimerFcn = {@update player, f_ech, h};
play(player);

function update(obj, event, player, f_ech, h)
	n = player.CurrentSample;
	h.Value = n / f_ech;
end


%% Affichage sonagrammes
N = 2048;                   % Taille de la fenêtre
D = 512;                    % Pas entre deux fenêtres
fenetre = 'hann';           % Type de fenêtre

Y = TFCT(y, N, D, fenetre);
valeurs_t = (0 : size(Y, 2) - 1) * D / f_ech;
valeurs_f = (0 : size(Y, 1) - 1) * f_ech / N;
S = 20 * log10(abs(Y));

Y_mod = TFCT(y_modifie, N, D, fenetre);
valeurs_t_mod = (0 : size(Y_mod, 2) - 1) * D / f_ech;
valeurs_f_mod = (0 : size(Y_mod, 1) - 1) * f_ech / N;
S_mod = 20 * log10(abs(Y_mod));

figure(Name='Sonagrammes comparés', Position=[0.1*L, 0.1*H, 0.8*L, 0.6*H]);

subplot(1,2,1);
imagesc(valeurs_t, valeurs_f, S, [-60, 40]);
axis xy;
set(gca, FontSize=18);
xlabel('Temps ($s$)', Interpreter='Latex', FontSize=24);
ylabel('Frequence ($Hz$)', Interpreter='Latex', FontSize=30);
title('Sonagramme original', FontSize=20);

subplot(1,2,2);
imagesc(valeurs_t_mod, valeurs_f_mod, S_mod, [-60, 40]);
axis xy;
set(gca, FontSize=18);
xlabel('Temps ($s$)', Interpreter='Latex', FontSize=24);
ylabel('Frequence ($Hz$)', Interpreter='Latex', FontSize=30);
title('Sonagramme modifié', FontSize=20);
