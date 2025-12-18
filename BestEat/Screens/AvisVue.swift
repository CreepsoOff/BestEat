//
//  AvisVue.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI

struct AvisVue: View {
    let restaurant: Restaurant
    
    // État pour stocker les avis générés
    @State private var listeAvis: [Avis] = []

    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 25) {
                    
                    // --- 1. EN-TÊTE NOTE GLOBALE ---
                    VStack(spacing: 10) {
                        Text(restaurant.nom)
                            .font(.custom("Redaction-Bold", size: 24))
                            .foregroundStyle(Color("BrownText"))
                            .multilineTextAlignment(.center)
                        
                        HStack(alignment: .center, spacing: 15) {
                            Text(String(format: "%.1f", restaurant.note))
                                .font(.system(size: 60, weight: .bold))
                                .foregroundStyle(Color("BrownText"))
                            
                            VStack(alignment: .leading, spacing: 5) {
                                HStack(spacing: 4) {
                                    ForEach(0..<5) { index in
                                        Image(systemName: index < Int(restaurant.note.rounded()) ? "star.fill" : "star")
                                            .foregroundStyle(.yellow)
                                            .font(.title3)
                                    }
                                }
                                Text("\(listeAvis.count) avis vérifiés")
                                    .font(.custom("Redaction-Regular", size: 14))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.top, 20)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        ForEach(listeAvis) { avis in
                            AvisRow(avis: avis)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Avis clients")
                    .font(.custom("Redaction-Regular", size: 24))
                    .foregroundStyle(Color("BrownText"))
            }
        }
        .onAppear {
            if listeAvis.isEmpty {
                listeAvis = genererAvisAleatoires()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AvisVue(restaurant: restaurants[0])
    }
}
