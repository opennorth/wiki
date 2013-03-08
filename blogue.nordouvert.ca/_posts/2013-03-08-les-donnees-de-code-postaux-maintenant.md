---
layout: post
title: "Leçons à tirer de Represent: il faut ouvrir les données de codes postaux maintenant!"
type: article
author: James McKinney et Ellie Marshall
date: 2013-03-08 
---
[Represent](http://represent.opennorth.ca) est un service web créé par Nord Ouvert qui permet aux citoyens canadiens de trouver gratuitement leurs représentants élus à partir d’un code postal. Les [organismes canadiens à but non lucratif utilisent Represent](http://blogue.nordouvert.ca/2013/01/29/utilisez-represente-dans-vos-campagnes/) pour aider leurs partisans à envoyer des lettres à leurs représentants au sujet d’enjeux qui les préoccupent.

Afin d’offrir ce service, nous devons avoir accès à des informations exactes sur les codes postaux. [Les États-Unis et le Royaume-Uni ont divulgué les données de codes postaux.](http://www.canadaone.com/ezine/may2012/canada_post_postal_code_dispute.html). Pourtant, Postes Canada réclame un droit d’auteur sur les codes postaux et [facture plus de 5 500 $](http://www.canadapost.ca/cpo/mc/business/productsservices/mailing/pcdp.jsf?LOCALE=fr) pour ses produits de données sur les adresses.
 
Les codes postaux ne sont pas seulement utiles à Represent. Par exemple, votre fournisseur internet peut déterminer s’il est actif dans votre région en vous demandant votre code postal. En général, le code postal permet de facilement identifier où se trouve une personne. Il est utilisé par les entreprises, les organismes à but non lucratif, les chercheurs, les démographes et les gouvernements. [Selon David Eaves](http://eaves.ca/2012/04/25/canada-posts-war-on-the-21st-century-innovation-productivity/), qui siège au [Conseil consultatif du gouvernement ouvert](http://www.ouvert.gc.ca/open-ouvert/bio-bio-fra.asp) du gouvernement fédéral, les codes postaux sont les données les plus demandées par le public.

Un accès à faible coût aux données postales profiterait à un grand nombre d’organisations et de personnes au Canada. Ce billet explore l’histoire et les origines des codes postaux et décrit les progrès accomplis vers une large diffusion des données.
 
##Que sont les codes postaux et d’où viennent-ils? 
Les trois premiers caractères d’un code postal indique la région de tri d’acheminement (RTA), ce qui représente un secteur d’une grande ville comme Montréal, une municipalité entière ou un regroupement de municipalités. Les trois derniers caractères indiquent l’unité de distribution locale (UDL), ce qui représente souvent un seul immeuble ou une série d’adresses sur une même rue. Au fur et à mesure qu’une municipalité se développe, elle crée de nouvelles adresses et partage gratuitement ces données avec Postes Canada. Postes Canada assigne alors des codes postaux à ces adresses.

La paternité et la propriété des codes postaux est un enjeu récent. Au début de 2012, Postes Canada a entrepris des actions légales contre deux fournisseurs de données postales, [Geocoder.ca](http://geocoder.ca/?sued=1) et [PopularData.com](http://www.populardata.com/postalcode_database.html), réclamant un droit d’auteur sur toute base de données de codes postaux. [La défense du CIPPIC](http://www.cippic.ca/sites/default/files/Geolytica_Statement_of_Defence.pdf) pour Geocoder.ca plaide que la Loi sur le droit d’auteur ne s’applique pas aux codes postaux et que, même si c’était le cas, Geocoder.ca n’aurait pas enfreint le droit d’auteur de Postes Canada. Aucune décision n’a encore été rendue.

##Obtenir des codes postaux pour Represent
[Les données postales de Represent](https://github.com/opennorth/represent-canada-data/tree/master/postcodes) ont été obtenues de sources gouvernementales officielles et de [Geocoder.ca](http://geocoder.ca/).
 
Nous avons déjà [expliqué le processus pour obtenir des municipalités les données sur limites des circonscriptions électorales](http://blogue.nordouvert.ca/lecons-tirees-de-represent-si-on-ne-demande-r/). Nous avons suivi un processus similaire et très simple pour obtenir les concordances des codes postaux de la part des provinces. (Une *concordance* est un dossier qui associe chaque code postal avec une ou plusieurs circonscriptions provinciales.) Quand une province refuse l’accès à ces données, il est important d’en comprendre la raison. Est-ce que la province concède une licence à une tierce partie? Qui pouvons-nous contacter pour obtenir l’accès? Après quelques discussions, il est parfois possible de négocier l’accès aux données à travers un contrat de licence. Voici un résumé des progrès accomplis jusqu’ici:
 
- Nous avons obtenu et publié les concordances pour le [Québec](https://github.com/opennorth/represent-canada-data/tree/master/postcodes/qc), le [Nouveau-Brunswick](https://github.com/opennorth/represent-canada-data/tree/master/postcodes/nb) et [Terre-Neuve-et-Labrador](https://github.com/opennorth/represent-canada-data/tree/master/postcodes/nl).
 
- Dans bien des cas, les provinces ne peuvent pas partager les données de codes postaux parce que leur contrat de licence avec Postes Canada ou [DMTI Spatial](http://www.dmtispatial.com/) les en empêchent. (DMTI Spatial donne accès aux frontières des UDL pour un montant de 11 275 $.) La Saskatchewan, l’Alberta et la Colombie-Britannique tombent dans cette catégorie.
 
- Élections Ontario [publiait auparavant](http://www.elections.on.ca/fr-ca/tools/electoraldistricts/postalcodefile.htm?lang=fr) ses concordances sur son site web. En mai 2012, suite à une demande de Postes Canada, Élections Ontario a retiré ces dossiers de son site web.
 
- Élections Québec [publie les concordances sur son site web](http://www.electionsquebec.qc.ca/francais/provincial/carte-electorale/renseignements-sur-les-circonscriptions-provinciales-2011.php). L’organisme a créé cette base de donnée en utilisant les informations des électeurs, sans s’appuyer sur les données de Postes Canada. 
 
- Le Manitoba, la Nouvelle-Écosse et l’Île-du-Prince-Édouard ne génèrent pas de concordances puisque les électeurs de ces provinces reçoivent souvent le courrier à une distance significative de leur lieu de résidence. Les codes postaux ne sont donc pas un bon indicateur des circonscriptions électorales dans lesquelles les citoyens résident.
 
##Ce qui nous reste à accomplir
Il est possible de concevoir les codes postaux en tant que [bien public](http://fr.wikipedia.org/wiki/Bien_public) qui devrait être diffusé sans droit d’auteur. En février 2013, Postes Canada a diffusé gratuitement [les limites des RTA](http://www5.statcan.gc.ca/bsolc/olc-cel/olc-cel?catno=92-179-X&lang=fra) à travers Statistique Canada, mais conserve le droit d’auteur et la marque officielle sur les codes postaux. C’est un pas dans la bonne direction, mais ce dont les Canadiens ont réellement besoin, ce sont les limites des UDL.

Dans les prochains mois, nous allons comparer les données postales provenant de tierces parties, comme Geocoder.ca, aux données de DMTI Spatial et de Postes Canada afin que les Canadiens puissent prendre une décision éclairée quand vient le temps de choisir le fournisseur à faible coût offrant le meilleur rapport qualité-prix. Nous avons hâte de vous faire part de nos résultats!