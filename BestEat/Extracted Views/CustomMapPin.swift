//
//  CustomMapPin.swift
//  BestEat
//
//  Created by apprenant98 on 18/12/2025.
//

import SwiftUI

struct CustomMapPin: View {
    let restaurant: Restaurant
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: isSelected ? 60 : 50, height: isSelected ? 60 : 50)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 4)
                
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: isSelected ? 54 : 44, height: isSelected ? 54 : 44)
                    .clipShape(Circle())
                
                if isSelected {
                    Circle()
                        .stroke(Color("DeepOrange"), lineWidth: 3)
                        .frame(width: 58, height: 58)
                    
                }
            }
            
            
            if isSelected {
                Text(restaurant.nom)
                    .font(.caption)
                    .bold()
                    .padding(6)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding(.top, 4)
            } else {
                Text(restaurant.nom)
                    .font(.caption)
                    .bold()
                    .cornerRadius(8)
                    .padding(.top, 4)
            }
        }
        .scaleEffect(isSelected ? 1.1 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}

#Preview {
    HStack(spacing: 20) {
        CustomMapPin(restaurant: restaurants[0], isSelected: false)
        CustomMapPin(restaurant: restaurants[1], isSelected: true)
    }
}
