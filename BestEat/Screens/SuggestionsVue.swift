//
//  SuggestionsVue.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct SuggestionsVue: View {
    
    let viande: Viande
    let regime: RegimeAlimentaire
    
    // --- FILTRE LOGIQUE ---
    var restaurantsSuggeres: [Restaurant] {
        restaurants.filter { resto in
            resto.viandes.contains(viande)
            /// Implémentation non faite car trop compliquée à gérer
            // && resto.tag.contains { $0.rawValue == regime.rawValue }
        }
    }
    
    let colonnes = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 25) {
                        
                        // --- EN-TÊTE ---
                        VStack(spacing: 8) {
                            Text("Nos suggestions")
                                .font(.custom("Redaction-Bold", size: 32))
                                .foregroundStyle(Color("BrownText"))
                            
                            Text("Basé sur \(viande.rawValue.lowercased()) & \(regime.rawValue.lowercased())")
                                .font(.custom("Redaction-Regular", size: 18))
                                .foregroundStyle(Color("DeepOrange"))
                        }
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                        
                        // --- GRILLE RÉSULTATS ---
                        if restaurantsSuggeres.isEmpty {
                            ContentUnavailableView(
                                "Aucun résultat",
                                systemImage: "fork.knife.circle",
                                description: Text("Essayez de modifier vos critères pour trouver une pépite !")
                            )
                            .foregroundStyle(Color("BrownText"))
                            .padding(.top, 50)
                        } else {
                            LazyVGrid(columns: colonnes, spacing: 20) {
                                ForEach(restaurantsSuggeres) { resto in
                                    // Lien vers le détail
                                    NavigationLink {
                                        RestaurantInfoDetails(restaurant: resto)
                                    } label: {
                                        SuggestionCard(restaurant: resto)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                        }
                    }
                }
            }
            .onAppear() {
                setupCustomNavBar()
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
        }
    }
    
    func setupCustomNavBar() {
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.shadowColor = .clear
        standard.backgroundColor = UIColor(named: "BackgroundCream")?.withAlphaComponent(0.5)

        standard.largeTitleTextAttributes = [
            .font: UIFont(name: "Redaction-Bold", size: 34) ?? UIFont.systemFont(ofSize: 34),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.brown
        ]
        standard.titleTextAttributes = [
            .font: UIFont(name: "Redaction-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.brown
        ]

        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.configureWithTransparentBackground()
        scrollEdge.largeTitleTextAttributes = standard.largeTitleTextAttributes
        scrollEdge.titleTextAttributes = standard.titleTextAttributes
        
        UINavigationBar.appearance().standardAppearance = standard
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdge
    }
}


#Preview {
    SuggestionsVue(viande: .boeuf, regime: .halal)
}
