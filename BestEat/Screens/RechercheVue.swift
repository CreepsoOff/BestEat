//
//  Recherche.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct RechercheVue: View {
    @State var rechercheTexte: String = ""
    
    // Logique de recherche textuelle
    var resultatFiltres: [Restaurant] {
        if rechercheTexte.isEmpty {
            return restaurants
        } else {
            return restaurants.filter { restaurant in
                restaurant.nom.localizedStandardContains(rechercheTexte)
            }
        }
    }
    
    // Logique pour trouver les restos "Sain" (Max 2)
    var restosSains: [Restaurant] {
        return restaurants.filter { $0.categorie == .sain }.prefix(2).map { $0 }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fond Crème
                Color("BackgroundCream").ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    
                    // 1. ZONE DES FILTRES (TAGS + VIANDES)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            
                            // A. Boucle sur les Viandes
                            // (On liste manuellement car Viande n'est pas CaseIterable dans ton code)
                            ForEach([Viande.poisson, Viande.poulet, Viande.boeuf, Viande.agneau], id: \.self) { viande in
                                HStack {
                                    Text(viande.emoji)
                                    Text(viande.rawValue)
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                            }
                            
                            // B. Boucle sur les Tags
                            ForEach(Tag.allCases, id: \.self) { tag in
                                HStack {
                                    Image(systemName: tag.icon)
                                        .font(.caption)
                                    Text(tag.rawValue)
                                        .font(.system(size: 14, weight: .medium))
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(tag.color) // Utilise la couleur de l'enum
                                .foregroundColor(Color(red: 0.43, green: 0.27, blue: 0.16)) // BrownText
                                .cornerRadius(20)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    }
                    
                    LazyVStack {
                        
                        // 2. ZONE RECOMMANDÉS (ALTERNATIVES SAINES)
                        // Cette zone ne s'affiche que s'il y a des restos sains
                        if !restosSains.isEmpty {
                            ZStack {
                                VStack(spacing: 12) {
                                    Text("⭐️ Recommandés (Alternatives saines)")
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.top, 16)
                                    
                                    // BOUCLE DYNAMIQUE : Affiche 2 restos sains max
                                    ForEach(restosSains) { restaurant in
                                        NavigationLink {
                                            RestaurantDetails(restaurant: restaurant)
                                        } label: {
                                            RestaurantCard(restaurant: restaurant)
                                                .padding(.horizontal)
                                        }
                                    }
                                    
                                    Spacer().frame(height: 10)
                                }
                            }
                            // .frame(width: 345, height: 305) // J'ai retiré la taille fixe pour laisser le contenu respirer
                            .background(Color.green.opacity(0.15)) // Fond vert clair
                            .cornerRadius(24)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        }
                        
                        // 3. TITRE TOP SELON VOS ENVIES
                        HStack {
                            Text("❤️ Top selon vos envies")
                                .font(.headline)
                                .padding(.vertical, 5)
                                .padding(.leading)
                            Spacer()
                        }
                        
                        // 4. LISTE PRINCIPALE (RÉSULTATS RECHERCHE)
                        ForEach(resultatFiltres) { restaurant in
                            NavigationLink {
                                RestaurantDetails(restaurant: restaurant)
                            } label: {
                                RestaurantCard(restaurant: restaurant)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                    .padding(.bottom, 80) // Espace pour la TabBar
                }
                
                .navigationTitle("Recherche")
                .searchable(text: $rechercheTexte, prompt: "Beef Art, Le Porthos..")
                .overlay {
                    if resultatFiltres.isEmpty {
                        ContentUnavailableView.search(text: rechercheTexte)
                    }
                }
                // Utilise ta couleur de fond Asset ou beige par défaut
                .background(Color("BackgroundCream"))
            }
            .onAppear {
                setupCustomNavBar()
            }
        }
    }
    
    
    func setupCustomNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(named: "BackgroundCream")
        
        // Gros titre
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "Redaction-Regular", size: 34) ?? UIFont.systemFont(ofSize: 34),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.black
        ]
        
        // Petit titre inline
        appearance.titleTextAttributes = [
            .font: UIFont(name: "Redaction-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.black
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    RechercheVue()
}
