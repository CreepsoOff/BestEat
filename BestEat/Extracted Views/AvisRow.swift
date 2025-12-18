//
//  AvisRow.swift
//  BestEat
//
//  Created by apprenant98 on 18/12/2025.
//

import SwiftUI

struct AvisRow: View {
    let avis: Avis
    
    private var dateFormatee: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: avis.date)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Circle()
                    .fill(Color("DeepOrange").opacity(0.1))
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text(avis.auteur.prefix(1).uppercased())
                            .font(.custom("Redaction-Bold", size: 20))
                            .foregroundStyle(Color("DeepOrange"))
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(avis.auteur)
                        .font(.custom("Redaction-Bold", size: 16))
                        .foregroundStyle(Color("BrownText"))
                    
                    Text(dateFormatee)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < avis.note ? "star.fill" : "star")
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                }
                .padding(6)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }
            
            Text(avis.commentaire)
                .font(.custom("Redaction-Regular", size: 15))
                .foregroundStyle(Color("BrownText").opacity(0.9))
                .lineSpacing(4)
                .padding(.leading, 5) // Petit retrait pour l'esthétique
            
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 2)
    }
}



#Preview {
    AvisRow(avis: Avis(auteur: "Auteur", note: 5, commentaire: "Miam le restaurant", date: Date()))
}
