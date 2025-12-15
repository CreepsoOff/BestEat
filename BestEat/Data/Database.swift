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
        desc:
            "Une escapade authentique au cœur du Vieux-Lille avec des produits directement venus d'Italie.",
        note: 4.8,
        menu: [
            Plat(
                nomPlat: "Truffle Pasta",
                descriptionPlat:
                    "Pâtes fraîches, crème de truffe noire, mascarpone.",
                imagePlat: "bellezzaplat"
            ),
            Plat(
                nomPlat: "Tiramisu della Nonna",
                descriptionPlat: "Servi à la louche, généreux et crémeux.",
                imagePlat: "dessert"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mardi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .samedi,
                    horaire: "12h00 - 15h00, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .dimanche,
                    horaire: "12h00 - 15h00, 19h00 - 22h30"
                ),
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

    // 2. Beef Art – MANDATORY
    Restaurant(
        nom: "Beef Art",
        desc:
            "Le temple de la viande maturée à Lille. Cadre chic et pièces de bœuf d'exception.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Tomahawk d'Irlande",
                descriptionPlat: "Pièce de 1.2kg maturée sur os.",
                imagePlat: "beefartplat"
            ),
            Plat(
                nomPlat: "Purée à la truffe",
                descriptionPlat: "L'accompagnement signature de la maison.",
                imagePlat: "puree_truffe"
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

    // 3. Fast-Food Lillois
    Restaurant(
        nom: "Raptor Shack",
        desc:
            "Street food de qualité, spécialisé dans le poulet frit et les sauces maison.",
        note: 4.5,
        menu: [
            Plat(
                nomPlat: "Le T-Rex",
                descriptionPlat: "Burger double poulet frit, cheddar, bacon.",
                imagePlat: "raptorshackplat"
            ),
            Plat(
                nomPlat: "Loaded Fries",
                descriptionPlat: "Frites, sauce fromagère, oignons frits.",
                imagePlat: "loaded_fries"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [
                .lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi,
                .dimanche,
            ],
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
        viandes: [.poulet],
        tag: [.fait_maison, .halal],
        estVisite: true,
        adresse: "18 Rue d'Amiens, 59800 Lille",
        image: "raptorshack",
        latitude: 50.63360,
        longitude: 3.06421,
        isLiked: true
    ),

    // 4. Restaurant Healthy
    Restaurant(
        nom: "We Are Ara",
        desc:
            "Brunch et lunch sain coloré, dans un cadre moderne rue de la Clef.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Avocado Toast",
                descriptionPlat: "Pain complet, avocat, grenade, oeuf poché.",
                imagePlat: "wearearaplat"
            ),
            Plat(
                nomPlat: "Pancakes Banane",
                descriptionPlat: "Sirop d'érable et fruits frais.",
                imagePlat: "pancakes_banane"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [
                .lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi,
                .dimanche,
            ],
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

    // 5. Poisson
    Restaurant(
        nom: "L'Ecume des Mers",
        desc:
            "Institution lilloise pour les plateaux de fruits de mer et poissons sauvages.",
        note: 4.6,
        menu: [
            Plat(
                nomPlat: "Saint-Jacques snackées",
                descriptionPlat: "Fondue de poireaux et beurre blanc.",
                imagePlat: "lecumedesmersplat"
            ),
            Plat(
                nomPlat: "Plateau Royal",
                descriptionPlat: "Homard, huîtres, langoustines, bulots.",
                imagePlat: "plateau_royal"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .samedi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(jour: .dimanche, horaire: "12h00 - 15h00"),
            ]
        ),
        categorie: .brasserie,
        typologie: .gastronomie,
        viandes: [.poisson],
        tag: [.poisson, .sain, .fait_maison],
        estVisite: false,
        adresse: "10 Rue du Pas, 59800 Lille",
        image: "ecumedesmers",
        latitude: 50.63727,
        longitude: 3.06151
    ),

    // 6. Le Porthos – MANDATORY
    Restaurant(
        nom: "Le Porthos",
        desc:
            "Brasserie traditionnelle au cœur du Vieux-Lille, ambiance conviviale et plats du terroir.",
        note: 4.2,
        menu: [
            Plat(
                nomPlat: "Potjevleesch",
                descriptionPlat: "Les 4 viandes en gelée, frites fraîches.",
                imagePlat: "leporthosplat"
            ),
            Plat(
                nomPlat: "Andouillette d'Arras",
                descriptionPlat: "Grillée, sauce moutarde à l'ancienne.",
                imagePlat: "andouillette"
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

    // 7. Estaminet
    Restaurant(
        nom: "Au Vieux de la Vieille",
        desc:
            "L'estaminet incontournable pour manger un Welsh ou une Carbonade.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Welsh Complet",
                descriptionPlat: "Cheddar, pain, jambon, oeuf, bière.",
                imagePlat: "auvieuxdelavieilleplat"
            ),
            Plat(
                nomPlat: "Mousse au Spéculoos",
                descriptionPlat: "Dessert léger et typique du Nord.",
                imagePlat: "mousse_speculoos"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mardi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h00, 19h00 - 23h00"
                ),
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
        image: "vieuxdelavieille",
        latitude: 50.64089,
        longitude: 3.06136
    ),

    // 8. Végétarien / Bio
    Restaurant(
        nom: "Itsy Bitsy",
        desc: "Cantine végétale créative et gourmande, 100% fait maison.",
        note: 4.5,
        menu: [
            Plat(
                nomPlat: "Lasagnes Végétales",
                descriptionPlat: "Légumes de saison rôtis, béchamel cajou.",
                imagePlat: "itsybitsyplat"
            ),
            Plat(
                nomPlat: "Carrot Cake",
                descriptionPlat: "Moelleux avec glaçage citronné.",
                imagePlat: "carrot_cake"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi],
            horaires: [
                HoraireOuvertureItem(jour: .lundi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(jour: .mardi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(jour: .mercredi, horaire: "12h00 - 14h30"),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 21h30"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h00"
                ),
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

    // 9. Resto rapide / Midi
    Restaurant(
        nom: "Honey & Pie",
        desc:
            "Tartes salées, soupes et desserts maison pour une pause déjeuner rapide.",
        note: 4.3,
        menu: [
            Plat(
                nomPlat: "Tarte Chèvre Épinard",
                descriptionPlat: "Pâte brisée maison, servie avec salade.",
                imagePlat: "honeypieplat"
            ),
            Plat(
                nomPlat: "Cheesecake",
                descriptionPlat: "Coulis de fruits rouges.",
                imagePlat: "dessert"
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

    // 10. Indien
    Restaurant(
        nom: "Le Maharaja",
        desc: "Un des plus anciens restaurants indiens de Lille, rue Gambetta.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Poulet Tikka Massala",
                descriptionPlat: "Sauce onctueuse aux épices douces.",
                imagePlat: "maharajaplat"
            ),
            Plat(
                nomPlat: "Cheese Naan",
                descriptionPlat: "La vache qui rit fondante à l'intérieur.",
                imagePlat: "cheese_naan"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mardi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 23h30"
                ),
                HoraireOuvertureItem(
                    jour: .samedi,
                    horaire: "12h00 - 14h30, 19h00 - 23h30"
                ),
                HoraireOuvertureItem(
                    jour: .dimanche,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
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

    // 11. Libanais
    Restaurant(
        nom: "Layalina",
        desc:
            "Cuisine libanaise raffinée, idéale pour partager des mezzés entre amis.",
        note: 4.7,
        menu: [
            Plat(
                nomPlat: "Assiette Découverte",
                descriptionPlat: "Houmous, moutabal, taboulé, kebbeh.",
                imagePlat: "layalinaplat"
            ),
            Plat(
                nomPlat: "Chiche Taouk",
                descriptionPlat: "Brochettes de poulet marinées au citron.",
                imagePlat: "chiche_taouk"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(
                    jour: .lundi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .mardi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
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

    // 12. Burger Gourmet
    Restaurant(
        nom: "Les Francs Burgers",
        desc:
            "Burgers avec des produits locaux du Nord et des fromages de région.",
        note: 4.6,
        menu: [
            Plat(
                nomPlat: "Le Maroilles",
                descriptionPlat:
                    "Steak Charolais, crème de Maroilles, oignons confits.",
                imagePlat: "lesfrancsburgerplat"
            ),
            Plat(
                nomPlat: "Frites au gras de boeuf",
                descriptionPlat: "Croustillantes et dorées à souhait.",
                imagePlat: "frites_gras_boeuf"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mardi, .mercredi, .jeudi, .vendredi, .samedi],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mardi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h00, 19h00 - 22h00"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h00, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(jour: .samedi, horaire: "12h00 - 22h30"),
            ]
        ),
        categorie: .fastFood,
        typologie: .snack,
        viandes: [.boeuf, .poulet],
        tag: [.fait_maison, .cosy],
        estVisite: false,
        adresse: "22 Place du Général de Gaulle, 59800 Lille",
        image: "francsburgers",
        latitude: 50.63688,
        longitude: 3.06342
    ),

    // 13. Marocain
    Restaurant(
        nom: "La Mamounia",
        desc:
            "Le voyage des sens près de la gare Lille Flandres. Couscous royal incontournable.",
        note: 4.5,
        menu: [
            Plat(
                nomPlat: "Tajine Agneau Pruneaux",
                descriptionPlat: "Sucré-salé avec amandes grillées.",
                imagePlat: "mamouniaplat"
            ),
            Plat(
                nomPlat: "Thé à la menthe",
                descriptionPlat: "Servi traditionnellement.",
                imagePlat: "the_menthe"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [.mercredi, .jeudi, .vendredi, .samedi, .dimanche],
            horaires: [
                HoraireOuvertureItem(
                    jour: .mercredi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .jeudi,
                    horaire: "12h00 - 14h30, 19h00 - 22h30"
                ),
                HoraireOuvertureItem(
                    jour: .vendredi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
                HoraireOuvertureItem(
                    jour: .samedi,
                    horaire: "12h00 - 14h30, 19h00 - 23h00"
                ),
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

    // 14. Turc / Grill
    Restaurant(
        nom: "Efes",
        desc:
            "Restaurant turc authentique, spécialité de grillades au feu de bois.",
        note: 4.4,
        menu: [
            Plat(
                nomPlat: "Assiette Mixte",
                descriptionPlat: "Adana, côtelette, poulet, boulgour.",
                imagePlat: "efesplat"
            ),
            Plat(
                nomPlat: "Kunefe",
                descriptionPlat: "Dessert chaud au fromage et cheveux d'ange.",
                imagePlat: "kunefe"
            ),
        ],
        horaireOuverture: OuvertureResto(
            jours: [
                .lundi, .mardi, .mercredi, .jeudi, .vendredi, .samedi,
                .dimanche,
            ],
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

    // 15. Thaï / Fusion
    Restaurant(
        nom: "Meet People",
        desc: "Fusion asiatique et ambiance tamisée rue de Gand.",
        note: 4.3,
        menu: [
            Plat(
                nomPlat: "Pad Thaï Crevettes",
                descriptionPlat: "Nouilles de riz sautées, cacahuètes.",
                imagePlat: "meetpeopleplat"
            ),
            Plat(
                nomPlat: "Tigre qui pleure",
                descriptionPlat: "Boeuf mariné et sauce épicée.",
                imagePlat: "tigre_qui_pleure"
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
        imagePlat: "risotto"
    ),
    Plat(
        nomPlat: "Poulet Teriyaki",
        descriptionPlat:
            "Poulet caramélisé avec sauce soja sucrée et graines de sésame.",
        imagePlat: "teriyaki"
    ),
    Plat(
        nomPlat: "Curry Vert Thaï",
        descriptionPlat:
            "Lait de coco, légumes croquants et épices thaïlandaises.",
        imagePlat: "curry_vert"
    ),
    Plat(
        nomPlat: "Fish & Chips",
        descriptionPlat:
            "Poisson frais frit avec frites maison et sauce tartare.",
        imagePlat: "fish_chips"
    ),
    Plat(
        nomPlat: "Gnocchis à la Crème",
        descriptionPlat: "Gnocchis grillés et sauce à la crème fraîche.",
        imagePlat: "gnocchis"
    ),
    Plat(
        nomPlat: "Falafels Maison",
        descriptionPlat:
            "Boules de pois chiches croustillantes et sauce tahini.",
        imagePlat: "falafels"
    ),
    Plat(
        nomPlat: "Bœuf Bourguignon",
        descriptionPlat: "Plat mijoté au vin rouge, carottes et lardons.",
        imagePlat: "bourguignon"
    ),
    Plat(
        nomPlat: "Pad Kra Pao",
        descriptionPlat: "Bœuf sauté au basilic thaï et riz jasmin.",
        imagePlat: "pad_kra_pao"
    ),
    Plat(
        nomPlat: "Pizza 4 Fromages",
        descriptionPlat: "Mozzarella, gorgonzola, chèvre et parmesan.",
        imagePlat: "pizza_4_fromages"
    ),
    Plat(
        nomPlat: "Saumon Gravlax",
        descriptionPlat: "Mariné à l’aneth, citron et baies roses.",
        imagePlat: "gravlax"
    ),
]
