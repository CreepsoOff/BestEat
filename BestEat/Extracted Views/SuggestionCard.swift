//
//  SuggestionCard.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI

import SwiftUI

struct SuggestionCard: View {
    
    // --- PROPRIÉTÉS ---
    let image: String
    let titre: String
    let sousTitre: String
    let note: Double?
    let prix: Double?
    
    // --- INITIALISEUR RESTAURANT ---
    init(restaurant: Restaurant) {
        self.image = restaurant.image
        self.titre = restaurant.nom
        self.sousTitre = restaurant.typologie.rawValue
        self.note = restaurant.note
        self.prix = nil
    }
    
    // --- INITIALISEUR PLAT ---
    init(plat: Plat) {
        self.image = plat.imagePlat
        self.titre = plat.nomPlat
        self.sousTitre = plat.descriptionPlat
        self.note = nil
        self.prix = plat.prix
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // 1. ZONE IMAGE (Hauteur fixe 100)
            ZStack {
                Color.gray.opacity(0.1)
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .frame(maxWidth: 180)
                    .clipped()
            }
            .frame(maxWidth: .infinity)
            
            // 2. ZONE TEXTE
            VStack(alignment: .leading, spacing: 4) {
                
                // TITRE
                Text(titre)
                    .font(.custom("Redaction-Bold", size: 17))
                    .foregroundStyle(Color("BrownText"))
                    .lineLimit(1)
                
                // PRIX ou NOTE
                if let note = note {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 14))
                            .foregroundStyle(.yellow)
                        Text(String(format: "%.1f", note))
                            .font(.custom("Redaction-Regular", size: 14))
                            .foregroundStyle(Color("BrownText"))
                    }
                } else if let prix = prix {
                    Text(String(format: "%.2f €", prix))
                        .font(.custom("Redaction-Bold", size: 15))
                        .foregroundStyle(Color("DeepOrange"))
                }
                
                // DESCRIPTION
                Text(sousTitre)
                    .font(.custom("Redaction-Regular", size: 12))
                    .foregroundStyle(Color.gray)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 0)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity)
            .background(Color.white)
        }
        // HABILLAGE CARTE
        .frame(height: 200) 
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color("BrownText").opacity(0.08), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    HStack {
        // Test avec un Resto
        SuggestionCard(restaurant: restaurants[5])
        // Test avec un Plat
        SuggestionCard(plat: restaurants[0].menu[1])
    }
    .padding()
    .background(Color("BackgroundCream"))
}
