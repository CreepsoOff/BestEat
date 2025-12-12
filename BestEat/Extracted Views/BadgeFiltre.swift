//
//  BadgeFiltre.swift
//  BestEat
//
//  Created by apprenant98 on 12/12/2025.
//

import SwiftUI

struct BadgeFiltre: View {
    let text: String
    let icon: String
    let isSFSymbol: Bool
    
    // État
    var isSelected: Bool
    // Action
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if isSFSymbol {
                    Image(systemName: icon)
                        .font(.system(size: 12, weight: .bold))
                } else {
                    Text(icon)
                        .font(.caption)
                }
                
                Text(text)
                    .font(.system(size: 14, weight: .semibold))

            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .foregroundStyle(isSelected ? .backgroundCream : .brownText)
            .background(isSelected ? .brownText : .backgroundCream)
          
            
            // -----------------------------
            
            .clipShape(Capsule())
            
            // OMBRE : Ajout d'une petite ombre pour le relief quand il est blanc
            .shadow(color: .black.opacity(isSelected ? 0 : 0.05), radius: 2, x: 0, y: 1)
            
            // BORDURE : Optionnelle, aide à la visibilité
            .overlay(
                Capsule()
                    .stroke(Color("BrownText").opacity(0.1), lineWidth: isSelected ? 0 : 1)
            )
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}

#Preview {
    ZStack {
        Color("BackgroundCream") // On simule le fond de l'app pour tester
        HStack {
            BadgeFiltre(text: "Test Off", icon: "🥩", isSFSymbol: false, isSelected: false, action: {})
            BadgeFiltre(text: "Test On", icon: "🥩", isSFSymbol: false, isSelected: true, action: {})
        }
    }
}
