//
//  MesMatchsCard.swift
//  BestEat
//
//  Created by apprenant98 on 18/12/2025.
//

import SwiftUI

struct MatchCard: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 15) {
            // Image
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Infos
            VStack(alignment: .leading, spacing: 5) {
                Text(restaurant.nom)
                    .font(.custom("Redaction-Bold", size: 18))
                    .foregroundStyle(Color("BrownText"))
                
                Text(restaurant.typologie.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.caption)
                    
                    Text(String(format: "%.1f", restaurant.note))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("BrownText"))
                }
            }
            
            Spacer()
            
            // Indicateur visuel "Aimé"
            Image(systemName: "heart.fill")
                .foregroundStyle(Color("DeepOrange"))
                .font(.title3)
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    MatchCard(restaurant: restaurants[2])
}
