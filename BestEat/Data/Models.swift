//
//  Models.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

enum Jour: String {
    case lundi    = "Lundi"
    case mardi    = "Mardi"
    case mercredi = "Mercredi"
    case jeudi    = "Jeudi"
    case vendredi = "Vendredi"
    case samedi   = "Samedi"
    case dimanche = "Dimanche"
}

enum Viande: String, CaseIterable {
    case boeuf   = "Boeuf"
    case poisson = "Poisson"
    case poulet  = "Poulet"
    case agneau  = "Agneau"
    
    var emoji: String {
        switch self {
        case .poisson: return "🐟"
        case .poulet:  return "🍗"
        case .boeuf:   return "🥩"
        case .agneau:  return "🐑"
        }
    }
    
    var color: Color {
        switch self {
        case .poisson: return Color(red: 0.98, green: 0.82, blue: 0.76) // Saumon (comme Fait Maison)
        case .poulet:  return Color(red: 1.00, green: 0.92, blue: 0.80) // Jaune pâle
        case .boeuf:   return Color(red: 0.96, green: 0.70, blue: 0.70) // Rouge doux
        case .agneau:  return Color(red: 0.90, green: 0.85, blue: 0.80) // Beige gris
        }
    }
}

enum ModeDeplacement: String {
    case pieds     = "à pieds"
    case voiture   = "en voiture"
    case transport = "en transport en commun"
    case velo      = "en vélo"
}

enum Budget: String {
    case petit = "0-5€"
    case moyen = "5-10€"
    case grand = "10-20€"
    case gros  = "+20€"
}

@Observable
class Plat: Identifiable {
    var id  = UUID()
    let nomPlat:         String
    let descriptionPlat: String
    let imagePlat: String
    var isFavori: Bool
    let prix: Double
    
    init(id: UUID = UUID(), nomPlat: String, descriptionPlat: String, imagePlat: String, isFavori: Bool = false, prix: Double = 0.00) {
        self.id = id
        self.nomPlat = nomPlat
        self.descriptionPlat = descriptionPlat
        self.imagePlat = imagePlat
        self.isFavori = isFavori
        self.prix = prix
    }
}

struct HoraireOuvertureItem {
    let jour:    Jour
    let horaire: String
}

struct OuvertureResto {
    let jours:    [Jour]
    let horaires: [HoraireOuvertureItem]
}

@Observable
class Restaurant: Identifiable {
    let id = UUID()
    let nom: String
    let desc: String
    var note: Double
    var menu: [Plat]
    let horaireOuverture: OuvertureResto
    let categorie: Categorie
    let typologie: TypeRestaurant
    let viandes: [Viande]
    let tag: [Tag]
    var estVisite: Bool
    let adresse: String
    let image: String
    let latitude: Double
    let longitude: Double
    var isLiked:          Bool
    var noteEtoile:       Int
    
    init(nom: String, desc: String, note: Double, menu: [Plat], horaireOuverture: OuvertureResto, categorie: Categorie, typologie: TypeRestaurant, viandes: [Viande], tag: [Tag], estVisite: Bool, adresse: String, image: String, latitude: Double, longitude: Double, isLiked: Bool = false, noteEtoile: Int = 0) {
        self.nom = nom
        self.desc = desc
        self.note = note
        self.menu = menu
        self.horaireOuverture = horaireOuverture
        self.categorie = categorie
        self.typologie = typologie
        self.viandes = viandes
        self.tag = tag
        self.estVisite = estVisite
        self.adresse = adresse
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.isLiked = isLiked
        self.noteEtoile = noteEtoile
    }
}

enum Categorie: String {
    case steakHouse =     "Steak-House"
    case fastFood =       "Fast-Food"
    case cafétéria =      "Cafétéria"
    case brasserie =      "Brasserie"
    case lesPub =         "Pubs"
    case sain =           "Sain"
    case traditionnel =   "Restaurant Traditionnel"
    case gastronomique =  "Gastronomique"
    case buffet =         "Buffet à volonté"
}

//enum Tag: String {
//    case poisson = "Poisson"
//    case vegetalien = "Végétalien"
//    case sain = "Sain"
//    case halal = "Halal"
//    case fait_maison = "Fait maison"
//    case sushi = "Sushi"
//    case sans_gluten = "Sans gluten"
//    case cosy = "Cosy"
//    case plats_mijotes = "Mijotés"
//}



enum Tag: String, CaseIterable {
    case poisson = "Poisson"
    case vegetalien = "Végétalien"
    case sain = "Sain"
    case halal = "Halal"
    case fait_maison = "Fait maison"
    case sushi = "Sushi"
    case sans_gluten = "Sans gluten"
    case cosy = "Cosy"
    case plats_mijotes = "Mijotés"
    
    // 1. Définir la couleur associée à chaque Tag
    var color: Color {
            switch self {
            case .poisson:       return Color(red: 0.68, green: 0.85, blue: 0.90) // Bleu ciel doux
            case .vegetalien:    return Color(red: 0.77, green: 0.89, blue: 0.70) // Vert amande pastel
            case .sain:          return Color(red: 1.00, green: 0.85, blue: 0.73) // Pêche clair
            case .halal:         return Color(red: 0.73, green: 0.75, blue: 0.90) // Bleu lavande
            case .fait_maison:   return Color(red: 0.98, green: 0.82, blue: 0.76) // Rose "saumon" poudré
            case .sushi:         return Color(red: 0.85, green: 0.75, blue: 0.90) // Mauve lilas
            case .sans_gluten:   return Color(red: 0.95, green: 0.90, blue: 0.67) // Jaune paille
            case .cosy:          return Color(red: 0.87, green: 0.78, blue: 0.68) // Beige "Latte"
            case .plats_mijotes: return Color(red: 0.96, green: 0.70, blue: 0.70) // Rouge corail doux
            }
        }
    
    // 2. Définir une icône SF Symbol pour chaque Tag
    var icon: String {
        switch self {
        case .poisson:       return "fish.fill"
        case .vegetalien:    return "leaf.fill"
        case .sain:          return "carrot.fill"
        case .halal:         return "checkmark.seal.fill"
        case .fait_maison:   return "house.fill"
        case .sushi:         return "circle.grid.cross.fill"
        case .sans_gluten:   return "allergens.fill"
        case .cosy:          return "sofa.fill"
        case .plats_mijotes: return "flame.fill"
        }
    }
}


enum Emotion: String {
    case joie = "Joyeux"
    case tristesse = "Triste"
    case colere = "En colère"
    case peur = "Apeuré"
    case surprise = "Surpris"
    case degout = "Dégoûté"
    case fatigue = "Fatigué"
    
    var emoji: String {
        switch self {
        case .joie:      return "😃"
        case .tristesse: return "😢"
        case .colere:    return "😡"
        case .peur:      return "😨"
        case .surprise:  return "😲"
        case .degout:    return "🤢"
        case .fatigue:   return "😴"
        }
    }
}

enum RegimeAlimentaire: String {
    case halal = "Halal"
    case cacher = "Cacher"
    case vegetalien = "Végétalien"
    case vegetarien = "Végétarien"
}

enum TypeRestaurant: String {
    case italien = "Cuisine italienne"
    case bar = "Bars à jus & healthy food"
    case gastronomie = "Cuisine gastronomique créative"
    case specialite = "Spécialités régionales & cuisine flamande"
    case monde = "Cuisine du monde"
    case bio = "Restaurants “green”"
    case snack = "Street-food gourmande"
}

struct Profil {
    var nom: String
    var budget: Budget
    var regime: [RegimeAlimentaire]
    var emotion: [Emotion]
}



// 1. Structure d'un Avis
struct Avis: Identifiable {
    let id = UUID()
    let auteur: String
    let note: Int // Sur 5
    let commentaire: String
    let date: Date
}

func genererAvisAleatoires() -> [Avis] {
    let nombreAvis = Int.random(in: 5...20)
    var resultats: [Avis] = []
    
    for _ in 0..<nombreAvis {
        let dateAleatoire = Date().addingTimeInterval(TimeInterval(-Int.random(in: 86400...15000000)))
        let noteAleatoire = Int.random(in: 3...5)
        
        let nouvelAvis = Avis(
            auteur: pseudosData.randomElement() ?? "Anonyme",
            note: noteAleatoire,
            commentaire: commentairesData.randomElement() ?? "Pas de commentaire.",
            date: dateAleatoire
        )
        resultats.append(nouvelAvis)
    }
    
    return resultats.sorted(by: { $0.date > $1.date })
}


extension Emotion: CaseIterable, Identifiable {
    var id: Self { self }
}

extension ModeDeplacement: CaseIterable, Identifiable {
    var id: Self { self }
}

extension Budget: CaseIterable, Identifiable {
    var id: Self { self }
}

extension RegimeAlimentaire: CaseIterable, Identifiable {
    var id: Self { self }
}

extension Viande: Identifiable {
    var id: Self { self }
}
