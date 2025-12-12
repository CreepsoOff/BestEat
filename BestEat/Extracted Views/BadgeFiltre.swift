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
            
            // --- COULEURS ---
            .foregroundStyle(isSelected ? .backgroundCream : .brownText)
            
            .background(isSelected ? .brownText : .backgroundCream)
            
            .clipShape(Capsule())
            
            // Ombrage
            .shadow(color: .black.opacity(isSelected ? 0 : 0.05), radius: 2, x: 0, y: 1)
            
            // --- CONTOUR (Overlay) ---
            .overlay(
                Capsule()
                    .stroke(isSelected ? .clear : .brownText.opacity(0.15))
            )
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}


#Preview {
    ZStack {
        Color.backgroundCream.ignoresSafeArea()
        HStack {
            // Test Inactif (Doit avoir le fond blanc et contour beige)
            BadgeFiltre(text: "Poisson", icon: "🍣", isSFSymbol: false, isSelected: false, action: {})
            
            // Test Actif (Fond marron)
            BadgeFiltre(text: "Poisson", icon: "🍣", isSFSymbol: false, isSelected: true, action: {})
        }
    }
}
