---
layout: post
title: "Entrevue avec les créateurs de la carte électorale du Tyee "
type: article
author: Ellie Marshall
---
Dans le cadre de la récente élection provinciale en Colombie-Britannique, [The Tyee](http://www.thetyee.ca), un magazine en ligne, a utilisé notre service [Represent](http://represent.opennorth.ca) pour son [guide de l’élection provinciale en Colombie-Britannique](http://election.thetyee.ca/) et ainsi engager le dialogue entre les lecteurs et les candidats électoraux. 

Comme nos lecteurs assidus le savent, Represent est une base de données sur les élus et sur les limites des circonscriptions électorales. Son API permet aux autres groupes civiques de chercher facilement les représentants associés à une adresse ou à un code postal.

Pour en apprendre davantage sur cet outil électoral et sur la façon dont il est bénéfique pour les citoyens, nous nous sommes entretenus avec le responsable du projet, [Phillip Smith](http://www.phillipadsmith.com/), et le rédacteur en chef du Tyee, [Robyn Smith](http://thetyee.ca/Bios/Robyn_Smith/), au sujet de leur expérience. 

<p style="text-align: center;"><img src="/img/blog/2013-06-20-the-tyee-map.jpg" width="500" height="322" alt="" title="Example of a slider scale"></p>  

**Nord Ouvert : Comment le projet a-t-il débuté?**<br>
**Phillip Smith** : D’un point de vue conceptuel, le projet a débuté il y a presque un an de cela. À la base, nous discutions seulement de ce qui serait possible de faire pour l’élection provinciale en Colombie-Britannique, d’un point de vue à la fois technique et éditorial. Nous avons fait des recherches afin de voir quelles données pouvaient être intégrées dans le projet (i.e. données sur les résultats électoraux précédents, donnés des représentants, etc.). À partir de là, nous avons commencé à bâtir des maquettes. Il y a six mois, nous parlions de plus en plus de l’élection au cours des réunions d’équipe. Le travail technique et éditorial a débuté plus sérieusement en janvier. 


**Lorsque vous avez créé l’outil, quels éléments avez-vous priorisés?**<br>
**PS:** Rien de bien spécial, seulement les éléments habituels d’une carte électorale, comme la division des circonscriptions, la possibilité de faire un zoom sur certaines régions, les informations présentées dans le survol de la carte électorale et le système de recherche décrit plus haut.


**Comment avez-vous découvert Represent?**<br>
**PS**: En général, j’essaie de garder l’œil ouvert pour les nouvelles initiatives canadiennes favorisant les données ouvertes. De plus, quand j’ai écrit à [Vote.ca](http://www.vote.ca) pour leur demander quel système de recherche était utilisé pour les limites électorales, j’ai été référé à [l’API de Represent](http://represent.opennorth.ca/API). J’ai rapidement réécrit notre outil afin qu’il emploie l’API de Represent. 

**Quel a été votre principal défi lorsque vous avez bâti l’outil?**<br>
**PS:** Deux choses, je dirais. D’abord, la connexion entre l’application et notre feuille de calcul Google qui fournissait l’information pour chaque circonscription et chaque candidat n’était pas fiable. Un grand volume de trafic sur l’application se traduisait invariablement par des erreurs dans l’API de Google Docs. À la base, de la mise en cache a été faite pour réduire le nombre de demandes formulées lorsque l’application servait un grand volume de trafic. Éventuellement, j’ai retiré tous les « remote calls » de l’application et j’ai créé des tâches différentes pour écrire sur un cache, alors que l’application allait uniquement lire ce cache. 


Le fait que nous avons fait du cache pour accélérer l’application – particulièrement des images et du JavaScript – voulait aussi dire qu’il était plus difficile de mettre à jour les documents GeoJSON/JSON/JavaScript qui nourrissaient la carte, parce que cela aurait voulu dire qu’il faille forcer les utilisateurs à télécharger à maintes reprises une nouvelle version. Compte tenu que nous voulions absolument rendre l’application disponible pour les appareils mobiles, c’était une priorité de réduire au maximum la taille et la quantité de données téléchargées. 

La prochaine fois, je séparerais sans doute les données géographiques et les données informatives destinées à la carte électorale afin qu’elles puissent être gérées et mises en cache de façon indépendante. 

**Si l’API de Represent n’avait pas été disponible, auriez-vous pu trouver les données ailleurs? Quel en aurait été le coût?**<br>
**PS**: Nous avons utilisé quelques avantages de l’API Represent, plus particulièrement la recherche d’élus par circonscription; les données complètes des criconscriptions électorales de la province et leur géométrie simplifiée (une tâche qui aurait pris beaucoup de temps si l’information n’avait pas été disponible); et le système de recherche de circonscription par longitude et latitude. 


Bien qu’il ait peut-être été possible de trouver ces données et de construire ces services, cela aurait pris significativement plus de temps. Même si la majorité des données sont disponibles, le tri, la classification et le travail de mise en cache se seraient traduits par de longues heures de travail qui auraient pu être investies ailleurs. 

**Comment le journalisme en période électoral a-t-il évolué depuis l’élection provinciale en Colombie-Britannique de 2009? Quels sont les objectifs du Tyee pour favoriser l’engagement des lecteurs?** <br>
**PS**: Les utilisateurs s’attendent sans doute à plus – plus d’informations, plus de mises à jour. Et ils veulent que tout cela soit disponible sur plusieurs types d’appareil. L’expérience de bâtir une application qui jumelait les données publiques aux reportages du Tyee tentait de répondre à ces besoins de façon novatrice. 

**Robyn Smith**: Je dirais que notre style de journalisme n’a probablement pas changé. Nous cherchons à être le plus pertinent et le plus juste possible, et à surprendre nos lecteurs en utilisant des approches originales. Mais je suis d’accord avec Phillip : il est vrai que nos lecteurs s’attendent à davantage maintenant, puisqu’ils nous ont vu croître en tant qu’organisation dans les quatre dernières années. Cette application est une des façons que nous avons trouvées pour en offrir davantage. Elle est simple et interactive, elle présente des profils de circonscription faciles à comprendre et qui se concentre sur les données importantes, comme les informations sur les candidats, les résultats électoraux précédents et un survol historique rédigé par les journalistes du Tyee. Cela permettait aussi de classer nos reportages de façon à ce qu’ils soient pertinents pour des circonscriptions en particulier. 

Nous croyons que pour engager les lecteurs, il faut les inclure le plus souvent possible dans nos projets. Ils sont intelligents, parfois de façon brutale. L’application leur donne une réelle possibilité de briller. Par exemple, la journée du lancement de l’application, à la fin du mois de février, nous avons reçu un tsunami de courriels de la part de lecteurs, de candidats et de politiciens. Nous avons reçu des suggestions pour améliorer l’outil, on nous a offert des nouvelles informations et on nous a réprimandé sur quelques erreurs! Cela a continué pendant des mois, et nous en avons tiré profit pour améliorer les profils. À la mi-avril, chaque page avait l’air très différente! Le projet était beaucoup plus riche grâce à l’implication des lecteurs. En ce sens, je crois que ça a été un succès. 


**Comment l’outil est-il bénéfique pour les électeurs? Est-ce que le Tyee a vu une augmentation de l’engagement des lecteurs avec cet outil?**<br>
**RS**: Notre objectif avec cette application était d’offrir des informations utiles, de stimuler le débat et de permettre aux électeurs de questionner leurs candidats sur les enjeux qui les préoccupent. J’espère que l’outil leur a été bénéfique de cette façon.

Si nous avons vu une augmentation de l’engagement des lecteurs suite à la mise en place de l’application? Si par « engagement » vous voulez dire du trafic, alors oui! L’outil a aussi été grandement partagé sur les réseaux sociaux, ce qui a représenté une autre occasion pour les lecteurs de s’impliquer.

**Quelles données pourraient être rendues disponibles par le gouvernement de la Colombie-Britannique ou par le gouvernement canadien (ou par la société civile!) afin de rendre cet outil encore plus puissant pour la prochaine élection?**<br>
**PS**: Nous avons travaillé de très près avec [Elections BC](http://www.elections.bc.ca/) afin de nous assurer que The Tyee aurait accès au dévoilement des résultats pendant la soirée électorale. L’échantillon des données est arrivé très tard (seulement quelques jours avant l’élection). Le fichier de données pour la soirée électorale comprenait des erreurs de formatage et de noms, erreurs que nous avons dû corriger quelques heures avant l’élection. Cela a créé du stress inutilement. J’espère que toutes les provinces seront plus proactives dans la publication des données pendant la soirée électorale et qu’elles publieront ces données dans un format plus cohérent avec les efforts de Represent. Par cela, je veux dire à travers une API, et non à travers un document CSV, qui doit être cherché, analysé et corrigé, et qui peut seulement être interrogé toutes les cinq minutes! On peut dire que ça a fonctionné, mais ce n’était pas la façon la plus « élégante » de le faire.


La [section sur les candidats](http://represent.opennorth.ca/api/#election) que Represent a ajouté à son API est quelque chose que j’aimerais voir plus souvent. Malheureusement, le Tyee avait déjà commencé son travail avant que cette section soit mise en ligne. Nous n’avons donc pas pu l’utiliser ou y contribuer. 


* Pour en apprendre davantage sur les façons dont vous pouvez utiliser Represent pour favoriser l’implication des citoyens dans les processus décisionnels, visitez [represent.opennorth.ca](http://represent.opennorth.ca).*
