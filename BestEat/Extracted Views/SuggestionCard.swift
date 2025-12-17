//
//  SuggestionCard.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI


// --- CARTE DE SUGGESTION ---
struct SuggestionCard: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // IMAGE
            ZStack {
                Color.gray.opacity(0.1)
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipped()
            }
            .frame(maxWidth: .infinity)
            
            // TEXTE
            VStack(alignment: .leading, spacing: 6) {
                
                Text(restaurant.nom)
                    .font(.custom("Redaction-Bold", size: 17))
                    .foregroundStyle(Color("BrownText"))
                    .lineLimit(1)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.yellow)
                    
                    Text(String(format: "%.1f", restaurant.note))
                        .font(.custom("Redaction-Regular", size: 14))
                        .foregroundStyle(Color("BrownText"))
                }
                
                Text(restaurant.typologie.rawValue)
                    .font(.custom("Redaction-Regular", size: 12))
                    .foregroundStyle(Color.gray)
                    .lineLimit(2) // Limite à 2 lignes max
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 0)
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity)
            .background(Color.white)
        }
        // Habillage de la card.
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color("BrownText").opacity(0.08), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    SuggestionCard(restaurant: restaurants[2])
}
