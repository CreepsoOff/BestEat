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
                /// Méthode avec image du premier plat
//                // Image
//                if let premierPlat = restaurant.menu.first {
//                    Image(premierPlat.imagePlat)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 97, height: 97)
//                        .clipShape(RoundedRectangle(cornerRadius: 16))
//                } else {
//                    // Sécurité : Si le menu est vide, on garde le rectangle gris
//                    Rectangle()
//                        .fill(Color.gray.opacity(0.3))
//                        .frame(width: 97, height: 97)
//                        .cornerRadius(16)
//                }
                Image(restaurant.image)
                    .resizable()
                    .frame(width: 97, height: 97)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(restaurant.nom)
                        .font(.custom("Redaction-Bold", size: 18))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                    
                    Text("\(restaurant.typologie.rawValue) •")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text(restaurant.desc)
                        .font(.system(size: 14))
                        .lineLimit(2)
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
                .foregroundStyle(.brownText)
                
                Spacer() 
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 113)
        .padding()
        .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 16))
    }
}

#Preview {
    RestaurantCard(restaurant: restaurants[0])
}
