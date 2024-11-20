# Contraintes SimplePDL
+ guidance text non vide
+ nom process non vide
+ nom process commence par majuscule et pas par un chiffre
+ nom workDefinition non vide
+ noms workDefinition unique
+ nom ressource non vide et commence par une lettre
+ noms ressource unique
+ *successor et predecessor dans même process* de toute facon il y a un seul process unique
+ pas de dépendances réflexives (une worksequence entre une même workdefinition)
+ nom d'une activité au moins 2 caractères
+ nom d'une activité composé de lettres, chiffres ou soulignés. un chiffre ne peut pas être en première position. la première lettre est en majuscule
+ nom d'une ressource au moins 2 caractères
+ nom d'une ressource composé de lettres, chiffres ou soulignés. un chiffre ne peut pas être en première position. la première lettre est minuscule
+ quantité d'une ressource non négative
+ occurences d'une request strictement plus grande que 0
+ une activité ne peut pas demander plusieurs fois une ressource (une seule request entre une activité et une ressource)
+ toutes les occurences des requests <= quantité de la ressource 


# Contraintes PetriNet
+ nom petriNet non vide
+ nom petriNet commence par majuscule et pas par un chiffre
+ nom transition non vide
+ noms transition uniques
+ nom place non vide
+ noms places uniques
+ tous les petriNetElement ont un nom unique qui commence par une lettre
+ nbToken d'une place >= 0
+ weight d'un arc > 0
+ une transition a au moins une entrée (un arc vers elle) et une sortie (un arc sortant)


