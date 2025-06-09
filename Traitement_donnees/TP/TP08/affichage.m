function affichage(u,nom_x,nom_y,titre, nb_canaux)

imagesc(u);
axis equal;
ax = gca;
axis(ax,'off');
xlh = xlabel(ax,nom_x,'Interpreter','Latex','FontSize',30);
xlh.Position(2) = xlh.Position(2)-40;
set(get(ax,'XLabel'),'Visible','on');
ylh = ylabel(ax,nom_y,'Interpreter','Latex','FontSize',30);
ylh.Position(1) = ylh.Position(1)+10;
set(get(ax,'YLabel'),'Visible','on');
if nb_canaux==1
    colormap gray
end
title(titre,'FontSize',30,'Interpreter','Latex');
