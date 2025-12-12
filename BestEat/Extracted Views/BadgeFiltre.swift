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
    let color: Color // La couleur pastel par défaut
    let isSFSymbol: Bool
    
    // NOUVEAU : On ajoute un état pour savoir s'il est sélectionné
    var isSelected: Bool
    // NOUVEAU : L'action à faire quand on clique
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
            // --- LOGIQUE DES COULEURS ---
            // Si sélectionné : Fond Bronze. Sinon : Fond Pastel
            .background(isSelected ? Color("SelectedBrown") : color)
            // Si sélectionné : Texte Blanc. Sinon : Texte Marron
            .foregroundColor(isSelected ? .white : Color("BrownText"))
            // -----------------------------
            .clipShape(Capsule())
            // Animation fluide lors du changement de couleur
            .animation(.easeInOut(duration: 0.2), value: isSelected)
        }
    }
}

//#Preview {
//    BadgeFiltre(text: Viande.poisson.rawValue, icon: Viande.poisson.emoji, color: Color("Cream"), isSFSymbol: false, isSelected: false, action: )
//}
