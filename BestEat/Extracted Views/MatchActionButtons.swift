//
//  MatchActionButtons.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct MatchActionButtons: View {
    var onPass: () -> Void
    var onLike: () -> Void
    
    var body: some View {
        HStack(spacing: 50) {
            // Bouton (X)
            Button(action: onPass) {
                Image(systemName: "xmark")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color.darkRed)
                    .frame(width: 70, height: 70)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)

            }
            .buttonStyle(.glassProminent)
            .tint(.lightRed)
            
            // Bouton (Coeur)
            Button(action: onLike) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.darkGreen)
                    .frame(width: 70, height: 70)
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
                    .glassEffect()
            }
            .buttonStyle(.glassProminent)
            .tint(.midGreen)
        }
        .padding(.top, 10)
    }
}

#Preview {
    MatchActionButtons(onPass: {}, onLike: {})
        .padding()
        .background(Color("BackgroundCream"))
}
