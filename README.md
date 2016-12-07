# projet-reseaux

###2.2.2
Il faut modifier le routage de VM1 pour la cible LAN4 afin d'envoyer
les trames sur LAN3 via VM1-6.
Pour VM1-6, on redirige les trames en direction de LAN4 vers tun0. 

###2.2.3-4-5
Le ping sur l'ip de tun0 fonctionne bien, cependant on ne peut pas capturer
le flux de ce ping car il passe directement par le noyau et n'est pas envoyé 
sur l'interface.

Quand on fait un ping sur 172.16.2.10 le noyau envoi les données sur tun0 on
a donc les requêtes de ping qui apparaissent sur wireshark (sans réponse).

###2.3.3-4

Une fois la redirection fait, notre programme "agit" comme wireshark en écoute
sur tun0, on obtien les même données.

IFF_NO_PI permet d'obtenir seulement les paquet IP tels quelle sans aucune
information ajouté par le noyau.



Auteurs : PELLETIER Sébasitne
		  BOUDERMINE Antoine
		  M1 Info TP1b
