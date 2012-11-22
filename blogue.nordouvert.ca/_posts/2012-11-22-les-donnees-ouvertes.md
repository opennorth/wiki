---
layout: post
title: "Les données ouvertes, les standards et Socrata"
type: article
author: Stéphane Guidoin, James McKinney 
date: 2012-11-22 14:12:38
---
La semaine dernière [Socrata](http://www.socrata.com/) a [annoncé](http://www.socrata.com/newsroom-article/socrata-announces-open-source-option-for-leading-open-data-cloud-platform/) “Open Data Standards,” [une initiative](http://open-data-standards.github.com/) qui a suscité des débats sur quelques listes de diffusions s’intéressant à la question des données ouvertes. Partant de cette annonce, le présent billet soulève quelques unes des questions qui accompagnent les tentatives de standardisation, une démarche de plus en plus centrale dans le développement des données ouvertes. (Si vous êtes familiers avec les problématiques de standardisation, vous préférerez peut-être aller directement à la partie concernant Socrata.)

### La nécessité de la standardisation

Les questions de standardisation ne sont pas nouvelles: toute innovation qui se propage finit par avoir besoin d’une étape d’uniformisation pour devenir plus prédictible et utilisable pour les utilisateurs potentiels. Prenons les ampoules: elles ont toutes les mêmes jeux de culots pour que l’acheteur sache que son achat va marcher chez lui. Même les nouvelles technologies (LED, fluocompacte) utilisent les mêmes culots pour éviter d’avoir à changer les inserts lorsqu’on veut changer d’ampoule. L’ensemble des acteurs (utilisateurs, producteurs, électriciens) bénéficient de cette standardisation.

Un nombre croissant de villes et d'états proposent leurs données en format ouvert mais il n’existe que très peu de standards ou même de sémantique commune. Si vous cherchez à obtenir des données budgétaires ouvertes, vous avez de bonnes chances d’avoir autant de formats de données que de jeux de données. Toutes les ampoules ont un culot différent! Le temps nécessaire pour s’adapter à tous ces formats est du temps perdu pour exploiter les données... quand cela n’en décourage pas l’usage purement et simplement.

Donc, comme pour les ampoules, il nous faut des standards. Les meilleurs exemples en la matière sont le [General Transit Feed Specification (GTFS)](https://developers.google.com/transit/gtfs/) et le format [Open311](http://open311.org/). Ces formats ont radicalement changé l’utilisation des données de transport en commun et de demandes de services municipaux. Des centaines d’agences de transport publient leurs données en GTFS et des centaines d’applications, autant pour les utilisateurs que pour les agences elles-mêmes ont été bâties: planificateur multi-modal, applications mobiles, outils d’analyse de couverture territoriale, tout y passe. Le même ecosystème s’est développé autour d’Open311 et rien n’empêcherait la même chose de se produire pour d’autres jeux de données.

### Standards De Facto

La majorité des standards orientés vers les données ouvertes ont commencé leur vie *de facto*, pour répondre à un besoin. Ainsi Google a développé la première version de GTFS en 2005, en collaboration avec TriMet, l’agence de transport de Portland en Oregon. Au fur et à mesure que d’autres agences ont adopté le format, Google a fait évoluer la spécification pour répondre aux nouveaux besoins. Google continue à être à l’écoute des besoins via une [liste de diffusion](https://developers.google.com/transit/gtfs/changes).

Comme on peut le constater pour GTFS (et il en va de même avec Open311), l’auteur original du standard en est aussi le dépositaire; le seul moyen d’obtenir une évolution est participer à une liste de diffusion et d’espérer être écouté. Si le dépositaire du format n’est pas en mesure de donner suite à plusieurs demandes, les risques sont élevés de voir ceux qui y adhéraient prendre leur distance et adopter toutes sortes de modifications.

C’est ce qu’il s’est passé récemment avec Open311: la ville de Chicago souhaitait modifier le format de données pour supporter un meilleur suivi des requêtes et pour pouvoir publier cette information, une demande formulée par d’autres villes. OpenPlans n’ayant pas les ressources pour coordonner cette évolution, Chicago, avec le support de Code for America, a mis en place une extension répondant à ses besoins. Par ailleurs, aucune indication ne montre que la spécification officielle va “rattraper” cette extension comme cela se produit parfois. Cela amène un réel risque de fragmention qui a terme pourrait être fatal au concept de standard.

Les standards de facto, de part leur cycle de vie, sont particulièrement à risque de manquer de support et de ressources pour évoluer au bénéfice de la communauté. Une des avenues possibles pour limiter ce risque est de passer par un organisme de standardisation.

### Les organismes de standardisation

Expliqué simplement, les organismes de standardisation visent à assurer un processus de standardisation clair, efficace et équitable. Des organisations comme le [World Wide Web Consortium (W3C)](http://www.w3.org/) sont établis pour assurer l’évolution du web sur base d’un consensus entre ses membres, son personnel et la communauté en général.

Pourquoi tous les standards ne suivent pas un tel cheminement? On trouve plusieurs bonnes et moins bonnes raisons: la volonté de garder le controle sur le standard, de rester flexible dans les évolution, le fait de trouver que le processus en place est satisfaisant ou l’existence d’incompatibilités idéologiques avec les organismes de standardisation les plus pertinents.
 
Par ailleurs, la participation à un organisme de standardisation peut être pénible et couteuse.  De nombreux acteurs du monde des données ouvertes sont des petites compagnies ou même des organisations informelles; rares sont ceux qui ont la capacité d’investir temps et argent dans un effort de standardisation. À Nord Ouvert, nous avons fait face à cela lorsque nous avons envisagé de soumettre  [Open511](http://blog.opennorth.ca/opening-new-roads-with-open511/) à l’[Open Geospatial Consortium (OGC)](http://www.opengeospatial.org/), avant de constater que le montant demandés pour être un membre pouvant soumettre un standard était hors d’atteinte pour nous.

Enfin, quand on parle de données ouvertes, on parle aussi d’accès libre. Certains organismes de standardisation ne rencontrent pas ce critère d’accessibilité, comme [l’International Organization for Standards (ISO)](http://www.iso.org/) dont les standards sont payants. Cette approche n’est pas compatible avec la philosophie des données ouvertes.

### Socrata

Venons-en à l’initiative de Socrata. Leur argument pour leur “open data standards” est d’être gratuit, et controlé par la communauté sur une base méritocratique pour être flexible dans la mise en place de standards. Inutile de dire que c’est intéressant et nous suivrons cela avec intérêt. Toutefois il existe déjà plusieurs initiatives similaires par des consortium en place. Quel est le besoin de lancer une initiative indépendante plutôt que de travailler sur celles déjà en cours?

Le président de Socrata, Will Pugh, a [décrit](http://lists.okfn.org/pipermail/open-government/2012-November/002479.html) récemment en quoi leur initiative différe de celle de l’[Open Knowledge Foundation (OKF)](http://okfn.org/). Rufus Pollock, co-fondateur de l’OKF émet toutefois de sérieux [doutes](http://lists.okfn.org/pipermail/open-government/2012-November/002478.html) quant au besoin de dupliquer une initiative incluant l’OKF, le W3C et d’autres acteurs importants.

Le processus [décrit](http://open-data-standards.github.com/) dans leur proposition semble très proche du *modus operandi* du [W3C](http://www.w3.org/2005/10/Process-20051014/). Le W3C:

* gère ses specifications dans Mercurials (Socrata propose Git)
* assure le suivi des problèmes avec son [“tracker” interne](http://www.w3.org/2005/06/tracker/) (Socrata propose GitHub)
* utilise des [listes de diffusion](http://lists.w3.org/) pour communiquer (Socrata propose un Google Group)

La principale différence en est surement une de perception: le W3C donne une image de lenteur.  Mais contrairement au W3C, Socrata fournit peu d’information sur la question de gouvernance. Qui pourra changer le standard? Est-ce qu’il s’agit d’un modèle sur base de consensus ou de 
[dictateur bienveillant](http://en.wikipedia.org/wiki/Benevolent_Dictator_for_Life)? Si une autre organisation utilise et participe au standard, quel controle peut-elle attendre sur son évolution?

Cela ne veut pas dire qu’il n’existe pas de salut hors des organisation de standardisation et la position d’“outsider” avec une structure de gouvernance souple peut être efficace pour mettre en place des standards de manière efficace. Par exemple le [WHATWG](http://www.whatwg.org/) a été créé par des employés d’Apple, de Mozilla et d'Opera en vue de créer HTML5. Ce groupe s’est constitué en réponse au manque de consensus et à la lenteur du W3C pour définir une nouvelle génération de standard du web. Trois ans plus tard, le W3C a adopté la spécification du WHATWG que les deux co-développent désormais. Cet appui du W3C fut un élément majeur en vue d’une large adoption du standard.

Il est d’ailleurs intéressant de noter que les personnes qui ont formé le WHATWG ont initialement participé aux efforts du W3C. Leur initiative hors des sentiers battus n’est que la conséquence d’une impasse. A contrario, Socrata ne semble pas, jusqu’à présent, avoir essayé de participer aux autres initiatives avant de lancer la sienne. Le groupe de travail sur les données gouvernementales liées [Government Linked Data Working Group](http://www.w3.org/2011/gld/wiki/Main_Page#Government_Linked_Data_.28GLD.29_Working_Group) du W3C, qui travaille sur le même sujet, n’a pas approché Socrata en particulier mais a contacté plusieurs développeurs et parties prenantes. M. Pugh relève cette omission comme une des raisons pour partir leur propre initiative. Toutefois, le W3C est ouvert à tous, n’importe qui peut se joindre à un groupe de travail et participer à une conversation en cours, plutôt que de commencer une autre discussion et ainsi fragmenter l’information.

Socrata semble envisager une démarche similaire à celle du WHATWG, écrivant “lorsque nous aurons plusieurs adoptions, nous pourront soumettre notre proposition à un organisme de standardisation pour le rendre officiel”. Mais en paralèlle, ils décrivent leur initiative comme une organisation de l’industrie, ce qui est nettement plus ambitieux que les objectifs d’un groupe comme le WHATWG. Quel seront les objectifs de cette organisation? 

### Le futur

Tel qu’expliqué plus haut, de nombreuses personnes travaillent déjà sur les sujets couverts par l’initiative de Socrata. Ainsi le groupe de travail sur le données liées du W3C, dont fait partie James McKinney, est sur le point de publier plusieurs standards importants comme un vocabulaire pour les catalogues de données (DCAT), de statistiques (Data Cube) et d’organisations. En parallèle, Microsoft, avec d’autres acteurs, ont soumis [OData](http://www.odata.org/) – un protocole de récupération et de modification de données ouvertes – auprès de l’[OASIS](https://www.oasis-open.org/), une organisation de standardisation similaire au W3C.

Concernant Open511, Nord Ouvert est actuellement en train de discuter avec des gouvernements, des représentants de l’industrie et des universitaires pour proposer un standard de qualité. L’ensemble des informations seront publiées prochainement et nous anticipons de soumettre le tout à une organisation de standardisation appropriée.

Toutes ces expériences nous montrent que le monde d’internet est très organique, c’est ce qui fait sa force mais c’est parfois un frein aux évolutions concertées. Le débat soulevé par l’idée de Socrata souligne le besoin auquel nous faisons face d’être aussi inclusif que possible et d’être à l’écoute des autres initiatives. Pour toutes ces raisons, un standard ne se fait pas en une journée.
