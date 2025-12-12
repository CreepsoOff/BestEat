//
//  RestaurantCard.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct RestaurantCard: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Image (Garde sa taille fixe)
                Rectangle() // Remplace par ton Image(restaurant.image) plus tard
                    .frame(width: 97, height: 97)
                    .cornerRadius(16)
                    .foregroundColor(.gray.opacity(0.3)) // Juste pour visualiser si pas d'image
                
                VStack(alignment: .leading, spacing: 4) { // Ajout d'un petit spacing pour la propreté
                    
                    Text(restaurant.nom)
                        .font(.custom("Redaction-Bold", size: 18))
                        .foregroundStyle(.black)
                        // Permet au texte d'être coupé proprement si trop long
                        .lineLimit(1)
                    
                    Text("\(restaurant.typologie.rawValue) •")
                        .font(.system(size: 14))
                        .foregroundColor(.gray) // Souvent plus lisible en gris foncé
                    
                    Text(restaurant.desc)
                        .font(.system(size: 14))
                        .lineLimit(2) // Limite la description à 2 lignes pour ne pas casser la hauteur
                        .foregroundStyle(.black)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(restaurant.tag, id: \.self) { unTag in
                                TagCapsule(tag: unTag)
                            }
                        }
                    }
                    .clipShape(Capsule())
                }
                .foregroundStyle(.brownText) // Si tu as défini cette couleur dans tes assets
                
                Spacer() // Pousse le contenu vers la gauche
            }
        }
        // --- CORRECTION ICI ---
        // On enlève width: 312 et on met maxWidth: .infinity
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 113)
        // ---------------------
        .padding()
        .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 16))
    }
}

#Preview {
    RestaurantCard(restaurant: restaurants[11])
}
