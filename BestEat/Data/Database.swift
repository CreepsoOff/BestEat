//
//  Database.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import Foundation

var restaurants: [Restaurant] = [

    // 1. Italien
    Restaurant(
        nom: "La Bellezza",
        desc: "Une escapade authentique au cœur du Vieux-Lille avec des produits directement venus d'Italie.",
        note: 4.8,
        menu: [
            Plat(
                nomPlat: "Truffle Pasta",
                descriptionPlat: "Pâtes fraîches, crème de truffe noire, mascarpone.",
                imagePlat: "bellezzaplat",
                prix: 18.0
            ),
            Plat(
                nomPlat: "Tiramisu della Nonna",
                descriptionPlat: "Servi à la louche, généreux et crémeux.",
                imagePlat: "tiramisu",
                prix: 8.5
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 15h00, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 15h00, 19h00 - 22h30"),
            ]
        ),
        categorie: .brasserie,
        typologie: .italien,
        viandes: [.boeuf],
        tag: [.fait_maison, .cosy, .vegetalien],
        estVisite: true,
        adresse: "126 Rue Esquermoise, 59800 Lille",
        image: "labellezza",
        latitude: 50.63897,
        longitude: 3.05880
    ),

    // 2. Beef Art
    Restaurant(
        nom: "Beef Art",
        desc: "Le temple de la viande maturée à Lille. Cadre chic et pièces de bœuf d'exception.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Tomahawk d'Irlande",
                descriptionPlat: "Pièce de 1.2kg maturée sur os.",
                imagePlat: "beefartplat",
                prix: 85.0
            ),
            Plat(
                nomPlat: "Purée à la truffe",
                descriptionPlat: "L'accompagnement signature de la maison.",
                imagePlat: "puree_truffe",
                prix: 6.0
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(jour: .jeudi, horaire: "19h00 - 23h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "19h00 - 00h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "19h00 - 00h00"),
            ]
        ),
        categorie: .steakHouse,
        typologie: .gastronomie,
        viandes: [.boeuf, .agneau],
        tag: [.cosy, .fait_maison, .halal],
        estVisite: false,
        adresse: "115 Rue de Gand, 59800 Lille",
        image: "beefart",
        latitude: 50.6425,
        longitude: 3.0660,
        isLiked: true
    ),

    // 3. Raptor Shack
    Restaurant(
        nom: "Raptor Shack",
        desc: "Street food de qualité, spécialisé dans le poulet frit et les sauces maison.",
        note: 5.0,
        menu: [
            Plat(
                nomPlat: "Le T-Rex",
                descriptionPlat: "Burger double poulet frit, cheddar, bacon.",
                imagePlat: "raptorshackplat",
                prix: 4.90
            ),
            Plat(
                nomPlat: "Loaded Fries",
                descriptionPlat: "Frites, sauce fromagère, oignons frits.",
                imagePlat: "loaded_fries",
                prix: 2.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "11h30 - 22h30"),
                HoraireOuvertureItem(jour: .mardi, horaire: "11h30 - 22h30"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "11h30 - 22h30"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "11h30 - 22h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "18h00 - 22h30"),
            ]
        ),
        categorie: .fastFood,
        typologie: .snack,
        viandes: [.poulet, .boeuf],
        tag: [.fait_maison, .halal],
        estVisite: true,
        adresse: "18 Rue d'Amiens, 59800 Lille",
        image: "raptorshack",
        latitude: 50.63360,
        longitude: 3.06421,
        isLiked: true
    ),

    // 4. We Are Ara
    Restaurant(
        nom: "We Are Ara",
        desc: "Brunch et lunch sain coloré, dans un cadre moderne rue de la Clef.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Avocado Toast",
                descriptionPlat: "Pain complet, avocat, grenade, oeuf poché.",
                imagePlat: "wearearaplat",
                prix: 13.50
            ),
            Plat(
                nomPlat: "Pancakes Banane",
                descriptionPlat: "Sirop d'érable et fruits frais.",
                imagePlat: "pancakes_banane",
                prix: 11.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "09h00 - 18h00"),
                HoraireOuvertureItem(jour: .mardi, horaire: "09h00 - 18h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "09h00 - 18h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "09h00 - 18h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "09h00 - 18h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "09h00 - 18h30"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "10h00 - 17h00"),
            ]
        ),
        categorie: .sain,
        typologie: .bar,
        viandes: [],
        tag: [.sain, .vegetalien, .sans_gluten, .cosy],
        estVisite: false,
        adresse: "14 Rue de la Clef, 59800 Lille",
        image: "weareara",
        latitude: 50.63680,
        longitude: 3.06500
    ),

    // 5. L'Ecume des Mers
    Restaurant(
        nom: "L'Ecume des Mers",
        desc: "Institution lilloise pour les plateaux de fruits de mer et poissons sauvages.",
        note: 4.6,
        menu: [
            Plat(
                nomPlat: "Saint-Jacques snackées",
                descriptionPlat: "Fondue de poireaux et beurre blanc.",
                imagePlat: "lecumedesmersplat",
                prix: 24.00
            ),
            Plat(
                nomPlat: "Plateau Royal",
                descriptionPlat: "Homard, huîtres, langoustines, bulots.",
                imagePlat: "plateau_royal",
                prix: 45.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 15h00"),
            ]
        ),
        categorie: .brasserie,
        typologie: .gastronomie,
        viandes: [.poisson],
        tag: [.poisson, .sain, .fait_maison, .sushi],
        estVisite: false,
        adresse: "10 Rue du Pas, 59800 Lille",
        image: "ecumedesmers",
        latitude: 50.63727,
        longitude: 3.06151
    ),

    // 6. Le Porthos
    Restaurant(
        nom: "Le Porthos",
        desc: "Brasserie traditionnelle au cœur du Vieux-Lille, ambiance conviviale et plats du terroir.",
        note: 4.2,
        menu: [
            Plat(
                nomPlat: "Potjevleesch",
                descriptionPlat: "Les 4 viandes en gelée, frites fraîches.",
                imagePlat: "leporthosplat",
                prix: 16.50
            ),
            Plat(
                nomPlat: "Andouillette d'Arras",
                descriptionPlat: "Grillée, sauce moutarde à l'ancienne.",
                imagePlat: "andouillette",
                prix: 15.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .jeudi, horaire: "11h00 - 23h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "11h00 - 00h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "11h00 - 00h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "11h00 - 22h00"),
            ]
        ),
        categorie: .brasserie,
        typologie: .specialite,
        viandes: [.boeuf, .poulet],
        tag: [.cosy, .plats_mijotes, .fait_maison],
        estVisite: true,
        adresse: "53 Rue de la Monnaie, 59800 Lille",
        image: "porthos",
        latitude: 50.64108,
        longitude: 3.06253,
        isLiked: true
    ),

    // 7. Au Vieux de la Vieille
    Restaurant(
        nom: "Au Vieux de la Vieille",
        desc: "L'estaminet incontournable pour manger un Welsh ou une Carbonade.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Welsh Complet",
                descriptionPlat: "Cheddar, pain, jambon, oeuf, bière.",
                imagePlat: "auvieuxdelavieilleplat",
                prix: 16.90
            ),
            Plat(
                nomPlat: "Mousse au Spéculoos",
                descriptionPlat: "Dessert léger et typique du Nord.",
                imagePlat: "mousse_speculoos",
                prix: 6.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h00, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 23h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 22h00"),
            ]
        ),
        categorie: .brasserie,
        typologie: .specialite,
        viandes: [.boeuf],
        tag: [.plats_mijotes, .cosy, .fait_maison],
        estVisite: true,
        adresse: "2 Rue des Vieux Murs, 59800 Lille",
        image: "auvieuxlille",
        latitude: 50.64089,
        longitude: 3.06136
    ),

    // 8. Itsy Bitsy
    Restaurant(
        nom: "Itsy Bitsy",
        desc: "Cantine végétale créative et gourmande, 100% fait maison.",
        note: 4.5,
        menu: [
            Plat(
                nomPlat: "Lasagnes Végétales",
                descriptionPlat: "Légumes de saison rôtis, béchamel cajou.",
                imagePlat: "itsybitsyplat",
                prix: 14.50
            ),
            Plat(
                nomPlat: "Carrot Cake",
                descriptionPlat: "Moelleux avec glaçage citronné.",
                imagePlat: "carrot_cake",
                prix: 5.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 21h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 22h00"),
            ]
        ),
        categorie: .sain,
        typologie: .bio,
        viandes: [],
        tag: [.sain, .vegetalien, .fait_maison, .cosy],
        estVisite: false,
        adresse: "10 Rue Jeanne Maillotte, 59800 Lille",
        image: "itsybitsy",
        latitude: 50.63176,
        longitude: 3.06298
    ),

    // 9. Honey & Pie
    Restaurant(
        nom: "Honey & Pie",
        desc: "Tartes salées, soupes et desserts maison pour une pause déjeuner rapide.",
        note: 4.3,
        menu: [
            Plat(
                nomPlat: "Tarte Chèvre Épinard",
                descriptionPlat: "Pâte brisée maison, servie avec salade.",
                imagePlat: "honeypieplat",
                prix: 10.50
            ),
            Plat(
                nomPlat: "Cheesecake",
                descriptionPlat: "Coulis de fruits rouges.",
                imagePlat: "cheesecake",
                prix: 4.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "11h30 - 15h00"),
                HoraireOuvertureItem(jour: .mardi, horaire: "11h30 - 15h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "11h30 - 15h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "11h30 - 15h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "11h30 - 15h00"),
            ]
        ),
        categorie: .cafétéria,
        typologie: .snack,
        viandes: [.poulet],
        tag: [.fait_maison, .sain],
        estVisite: true,
        adresse: "15 Rue des Ponts de Comines, 59800 Lille",
        image: "honeyandpie",
        latitude: 50.63690,
        longitude: 3.06720
    ),

    // 10. Le Maharaja
    Restaurant(
        nom: "Le Maharaja",
        desc: "Un des plus anciens restaurants indiens de Lille, rue Gambetta.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Poulet Tikka Massala",
                descriptionPlat: "Sauce onctueuse aux épices douces.",
                imagePlat: "maharajaplat",
                prix: 13.90
            ),
            Plat(
                nomPlat: "Cheese Naan",
                descriptionPlat: "La vache qui rit fondante à l'intérieur.",
                imagePlat: "cheese_naan",
                prix: 3.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 23h30"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 14h30, 19h00 - 23h30"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 14h30, 19h00 - 23h00"),
            ]
        ),
        categorie: .buffet,
        typologie: .monde,
        viandes: [.poulet, .agneau],
        tag: [.plats_mijotes, .cosy, .halal],
        estVisite: false,
        adresse: "156 Rue Léon Gambetta, 59000 Lille",
        image: "maharaja",
        latitude: 50.63120,
        longitude: 3.05952
    ),

    // 11. Layalina
    Restaurant(
        nom: "Layalina",
        desc: "Cuisine libanaise raffinée, idéale pour partager des mezzés entre amis.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Assiette Découverte",
                descriptionPlat: "Houmous, moutabal, taboulé, kebbeh.",
                imagePlat: "layalinaplat",
                prix: 18.00
            ),
            Plat(
                nomPlat: "Chiche Taouk",
                descriptionPlat: "Brochettes de poulet marinées au citron.",
                imagePlat: "chiche_taouk",
                prix: 15.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 23h00"),
            ]
        ),
        categorie: .sain,
        typologie: .monde,
        viandes: [.boeuf, .agneau, .poulet],
        tag: [.halal, .sain, .fait_maison, .vegetalien],
        estVisite: true,
        adresse: "34 Rue de l'Hôpital Militaire, 59800 Lille",
        image: "layalina",
        latitude: 50.63500,
        longitude: 3.06100
    ),

    // 12. Les Francs Burgers
    Restaurant(
        nom: "Les Francs Burgers",
        desc: "Burgers avec des produits locaux du Nord et des fromages de région.",
        note: 4.6,
        menu: [
            Plat(
                nomPlat: "Le Maroilles",
                descriptionPlat: "Steak Charolais, crème de Maroilles, oignons confits.",
                imagePlat: "lesfrancsburgerplat",
                prix: 15.90
            ),
            Plat(
                nomPlat: "Frites au gras de boeuf",
                descriptionPlat: "Croustillantes et dorées à souhait.",
                imagePlat: "frites_gras_boeuf",
                prix: 4.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h00, 19h00 - 22h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h00, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 22h30"),
            ]
        ),
        categorie: .fastFood,
        typologie: .snack,
        viandes: [.boeuf, .poulet],
        tag: [.fait_maison, .cosy],
        estVisite: false,
        adresse: "22 Place du Général de Gaulle, 59800 Lille",
        image: "thedublincorner",
        latitude: 50.63688,
        longitude: 3.06342
    ),

    // 13. La Mamounia
    Restaurant(
        nom: "La Mamounia",
        desc: "Le voyage des sens près de la gare Lille Flandres. Couscous royal incontournable.",
        note: 4.5,
        menu: [
            Plat(
                nomPlat: "Tajine Agneau Pruneaux",
                descriptionPlat: "Sucré-salé avec amandes grillées.",
                imagePlat: "mamouniaplat",
                prix: 17.50
            ),
            Plat(
                nomPlat: "Thé à la menthe",
                descriptionPlat: "Servi traditionnellement.",
                imagePlat: "the_menthe",
                prix: 2.50
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "12h00 - 14h30, 19h00 - 22h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 14h30, 19h00 - 23h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 15h00"),
            ]
        ),
        categorie: .brasserie,
        typologie: .monde,
        viandes: [.agneau, .poulet, .boeuf],
        tag: [.halal, .plats_mijotes, .cosy],
        estVisite: true,
        adresse: "12 Place de la Gare, 59000 Lille",
        image: "mamounia",
        latitude: 50.63660,
        longitude: 3.06940
    ),

    // 14. Efes
    Restaurant(
        nom: "Efes",
        desc: "Restaurant turc authentique, spécialité de grillades au feu de bois.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Assiette Mixte",
                descriptionPlat: "Adana, côtelette, poulet, boulgour.",
                imagePlat: "efesplat",
                prix: 19.50
            ),
            Plat(
                nomPlat: "Kunefe",
                descriptionPlat: "Dessert chaud au fromage et cheveux d'ange.",
                imagePlat: "kunefe",
                prix: 8.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .mardi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "11h30 - 23h00"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "11h30 - 00h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "11h30 - 00h00"),
                HoraireOuvertureItem(jour: .dimanche, horaire: "11h30 - 23h00"),
            ]
        ),
        categorie: .steakHouse,
        typologie: .monde,
        viandes: [.agneau, .boeuf],
        tag: [.halal, .fait_maison],
        estVisite: false,
        adresse: "88 Rue des Postes, 59000 Lille",
        image: "efes",
        latitude: 50.62600,
        longitude: 3.05400
    ),

    // 15. Meet People
    Restaurant(
        nom: "Meet People",
        desc: "Fusion asiatique et ambiance tamisée rue de Gand.",
        note: 4.3,
        menu: [
            Plat(
                nomPlat: "Pad Thaï Crevettes",
                descriptionPlat: "Nouilles de riz sautées, cacahuètes.",
                imagePlat: "meetpeopleplat",
                prix: 14.90
            ),
            Plat(
                nomPlat: "Tigre qui pleure",
                descriptionPlat: "Boeuf mariné et sauce épicée.",
                imagePlat: "tigre_qui_pleure",
                prix: 19.00
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(jour: .mardi, horaire: "19h00 - 23h00"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "19h00 - 23h00"),
                HoraireOuvertureItem(jour: .jeudi, horaire: "19h00 - 23h30"),
                HoraireOuvertureItem(jour: .vendredi, horaire: "19h00 - 00h00"),
                HoraireOuvertureItem(jour: .samedi, horaire: "19h00 - 00h00"),
            ]
        ),
        categorie: .traditionnel,
        typologie: .monde,
        viandes: [.poulet, .boeuf],
        tag: [.cosy, .fait_maison, .sans_gluten],
        estVisite: true,
        adresse: "20 Rue de Gand, 59800 Lille",
        image: "meetpeople",
        latitude: 50.64185,
        longitude: 3.06573
    ),
]

let plats: [Plat] = [
    Plat(
        nomPlat: "Risotto aux Champignons",
        descriptionPlat: "Crémeux, parmesan affiné et champignons poêlés.",
        imagePlat: "risotto",
        prix: 16.50
    ),
    Plat(
        nomPlat: "Poulet Teriyaki",
        descriptionPlat: "Poulet caramélisé avec sauce soja sucrée et graines de sésame.",
        imagePlat: "teriyaki",
        prix: 14.90
    ),
    Plat(
        nomPlat: "Curry Vert Thaï",
        descriptionPlat: "Lait de coco, légumes croquants et épices thaïlandaises.",
        imagePlat: "curry_vert",
        prix: 15.50
    ),
    Plat(
        nomPlat: "Fish & Chips",
        descriptionPlat: "Poisson frais frit avec frites maison et sauce tartare.",
        imagePlat: "fish_chips",
        prix: 17.00
    ),
    Plat(
        nomPlat: "Gnocchis à la Crème",
        descriptionPlat: "Gnocchis grillés et sauce à la crème fraîche.",
        imagePlat: "gnocchis",
        prix: 13.50
    ),
    Plat(
        nomPlat: "Falafels Maison",
        descriptionPlat: "Boules de pois chiches croustillantes et sauce tahini.",
        imagePlat: "falafels",
        prix: 11.00
    ),
    Plat(
        nomPlat: "Bœuf Bourguignon",
        descriptionPlat: "Plat mijoté au vin rouge, carottes et lardons.",
        imagePlat: "bourguignon",
        prix: 18.90
    ),
    Plat(
        nomPlat: "Pad Kra Pao",
        descriptionPlat: "Bœuf sauté au basilic thaï et riz jasmin.",
        imagePlat: "pad_kra_pao",
        prix: 16.00
    ),
    Plat(
        nomPlat: "Pizza 4 Fromages",
        descriptionPlat: "Mozzarella, gorgonzola, chèvre et parmesan.",
        imagePlat: "pizza_4_fromages",
        prix: 14.50
    ),
    Plat(
        nomPlat: "Saumon Gravlax",
        descriptionPlat: "Mariné à l’aneth, citron et baies roses.",
        imagePlat: "gravlax",
        prix: 19.00
    ),
]



let pseudosData = [
    // --- Foodies & Gourmands ---
    "Gourmet_Lille", "Tasty_Life", "Burger_Lover_59", "Pizza_Addict", "Le_Bon_Vivant",
    "Sucré_Salé", "Croque_Monsieur", "Chef_Panda", "Yummy_Julie", "Gastronome_Amateur",
    "Bistrot_Lover", "Healthy_Vibes", "Fan_De_Sushi", "Choco_Addict", "Brunch_Queen",
    
    // --- Classiques (Prénom + Initiale/Chiffre) ---
    "Thomas_L", "Marie_Dupond", "Lucas1990", "Sophie_M", "Julien_C",
    "Camille.B", "Nico_59", "Sarah_Lille", "Kevin_Du59", "Elodie_M",
    "Antoine_R", "Celine_D", "Maxime_L", "Pauline_75", "Alexandre_B",
    
    // --- Lifestyle & Fun ---
    "Traveler_Max", "Sunny_Day", "City_Walker", "Night_Owl", "Weekend_Vibes",
    "Happy_Family", "Student_Life", "Coffee_Time", "Green_Spirit", "Urban_Food",
    "Zouzou_59", "Kika_Love", "Juju_Fit", "Alex_The_Great", "Doudou_Cool",
    
    // --- Locaux (Nord) ---
    "Ch_ti_Gourmand", "Frites_Forever", "Grand_Place_Fan", "Nordiste_Fier", "Lille_Ma_Ville",
    "Vieux_Lille_Lover", "Rijsel_Boy", "Miss_Maroilles", "Biloute_59", "Ch_ti_Biloute"
]

let commentairesData = [
    // --- TOP TIER (Extrêmement positif) ---
    "C'est sans doute le meilleur repas que j'ai mangé depuis longtemps ! Une tuerie.",
    "Un service aux petits soins et une équipe adorable. On s'y sent comme à la maison.",
    "Une véritable explosion de saveurs, je recommande les yeux fermés !",
    "L'ambiance est chaleureuse et la déco est magnifique. Parfait pour une soirée réussie.",
    "Une adresse incontournable, tout était parfait du début à la fin. Bravo !",
    "Des plats copieux, gourmands et magnifiquement présentés. On en a pour son argent.",
    "On sent que les produits sont frais et de grande qualité. Un pur régal !",
    "Gardez absolument de la place pour le dessert, c'était divin !",
    "J'y retournerai très vite, c'est devenu mon restaurant préféré à Lille.",
    "Bravo au chef, la cuisson était maîtrisée à la perfection et les sauces incroyables.",
    
    // --- NOURRITURE & SAVEURS ---
    "Les assaisonnements étaient justes parfaits, rien à redire.",
    "Une cuisine authentique qui fait du bien au moral.",
    "J'ai pris le plat du jour et je n'ai pas été déçu, c'était excellent.",
    "Le pain était frais et croustillant, un détail qui fait la différence.",
    "Les options végétariennes sont vraiment travaillées et savoureuses.",
    "La viande était tendre à souhait, un vrai plaisir.",
    "Des saveurs originales que je n'avais jamais goûtées ailleurs.",
    "Tout est fait maison et ça se sent dès la première bouchée.",
    "Le dressage des assiettes est digne d'un grand restaurant gastronomique.",
    "Le café gourmand porte très bien son nom, très généreux !",

    // --- SERVICE & AMBIANCE ---
    "Le personnel est très souriant et de bon conseil pour le vin.",
    "Service rapide et efficace, parfait pour une pause déjeuner.",
    "Le patron est venu nous saluer, une attention très sympathique.",
    "L'ambiance musicale était top, ni trop fort ni trop bas.",
    "Un cadre cosy et intimiste, idéal pour un rendez-vous amoureux.",
    "On a passé un super moment entre amis, on a bien rigolé avec le serveur.",
    "La terrasse est très agréable dès qu'il y a un rayon de soleil.",
    "Restaurant très propre et bien tenu, c'est rassurant.",
    "L'équipe en salle est dynamique et très professionnelle.",
    "Une atmosphère détendue, on ne nous a pas pressés pour partir.",

    // --- RAPPORT QUALITÉ / PRIX & GÉNÉRAL ---
    "Excellent rapport qualité-prix, je suis bluffé.",
    "Pour la qualité des produits, l'addition est plus que correcte.",
    "Une belle découverte, je ne connaissais pas du tout ce quartier.",
    "Pensez à réserver car c'était complet, la rançon du succès !",
    "Une petite pépite cachée que je suis content d'avoir trouvée.",
    "Je valide à 100%, allez-y foncez !",
    "Une expérience culinaire que je n'oublierai pas de sitôt.",
    "Merci pour ce moment de partage et de gourmandise.",
    "C'est rare de trouver une telle qualité de service de nos jours.",
    "Tout simplement merci, nous reviendrons avec grand plaisir.",

    // --- COURTS & EFFICACES ---
    "Superbe !",
    "Un régal.",
    "Juste parfait.",
    "A tester absolument.",
    "Miam !",
    "Une valeur sûre.",
    "Top du top.",
    "Délicieux moment.",
    "Je recommande !",
    "5 étoiles méritées."
]
