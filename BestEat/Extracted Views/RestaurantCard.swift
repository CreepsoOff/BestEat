//
//  RestaurantCard.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

// Exemple d'utilisation dans une vue
struct RestaurantCard: View {
    let restaurant: Restaurant // Ton modèle restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Rectangle()
                    .frame(width: 97, height: 97)
                    .cornerRadius(16)
                VStack(alignment: .leading) {
                    
                    Text(restaurant.nom)
                        .font(.title3.bold())
                        .foregroundStyle(.black)
                    
                    Text(
                        """
                        \(Text(restaurant.typologie.rawValue)
                            .foregroundStyle(.black))\
                        \(Text(" •")
                            .foregroundStyle(.black))
                        """
                    )
                    .font(.system(size: 14))
                    
                    Text(restaurant.desc)
                        .font(.system(size: 14))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(restaurant.tag, id: \.self) { unTag in
                                TagCapsule(tag: unTag)
                            }
                        }
                    }
                    .clipShape(Capsule())
                }
            }
        }
        .frame(width: 312, height: 113)
        .padding()
        .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 16))
        
        
        
    }
}

#Preview {
    RestaurantCard(restaurant: restaurants[2])
}
