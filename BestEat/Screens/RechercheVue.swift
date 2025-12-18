//
//  Recherche.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct RechercheVue: View {
    @State var rechercheTexte: String = ""
    
    // --- ETATS POUR LA MULTI-SELECTION ---
    @State private var viandesSelectionnees: Set<Viande> = []
    @State private var tagsSelectionnes: Set<Tag> = []
    
    // Logique de recherche et filtrage
    var resultatFiltres: [Restaurant] {
        var resultats = restaurants
        
        // 1. Filtre Texte
        if !rechercheTexte.isEmpty {
            resultats = resultats.filter { restaurant in
                restaurant.nom.localizedStandardContains(rechercheTexte)
            }
        }
        
        // 2. Filtre Tags
        if !tagsSelectionnes.isEmpty {
            resultats = resultats.filter { restaurant in
                
                if tagsSelectionnes.contains(.vegetalien) && !restaurant.viandes.isEmpty {
                    return false
                }
                
                return tagsSelectionnes.contains { tagSelectionne in
                    if tagSelectionne == .poisson {
                        return restaurant.tag.contains(.poisson) || restaurant.viandes.contains(.poisson)
                    }
                    return restaurant.tag.contains(tagSelectionne)
                }
            }
        }
        
        // 3. Filtre Viandes
        if !viandesSelectionnees.isEmpty {
            resultats = resultats.filter { restaurant in
                restaurant.viandes.contains { viandeDuResto in
                    viandesSelectionnees.contains(viandeDuResto)
                }
            }
        }
        
        return resultats
    }
    
    var restosSains: [Restaurant] {
         return restaurants.filter { $0.tag.contains(.sain) }.prefix(2).map { $0 }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    // ------------------------------------------------
                    // ZONE FILTRES
                    // ------------------------------------------------
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {

                            // A. Viandes
                            ForEach([Viande.poulet, Viande.boeuf, Viande.agneau], id: \.self) { viande in
                                BadgeFiltre(
                                    text: viande.rawValue,
                                    icon: viande.emoji,
                                    isSFSymbol: false,
                                    isSelected: viandesSelectionnees.contains(viande),
                                    action: {
                                        withAnimation {
                                            if viandesSelectionnees.contains(viande) {
                                                viandesSelectionnees.remove(viande)
                                            } else {
                                                viandesSelectionnees.insert(viande)
                                            }
                                        }
                                    }
                                )
                            }
                            
                            // B. Tags
                            ForEach(Tag.allCases, id: \.self) { tag in
                                BadgeFiltre(
                                    text: tag.rawValue,
                                    icon: tag.icon,
                                    isSFSymbol: true,
                                    isSelected: tagsSelectionnes.contains(tag),
                                    action: {
                                        withAnimation {
                                            if tagsSelectionnes.contains(tag) {
                                                tagsSelectionnes.remove(tag)
                                            } else {
                                                tagsSelectionnes.insert(tag)
                                            }
                                        }
                                    }
                                )
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                    }
                    
                    // ------------------------------------------------
                    // ZONE RESULTATS
                    // ------------------------------------------------
                    
                    if resultatFiltres.isEmpty {
                        ContentUnavailableView.search(text: rechercheTexte)
                            .padding(.top, 40)
                    } else {
                        LazyVStack {
                            
                            
                            if !restosSains.isEmpty && rechercheTexte.isEmpty && viandesSelectionnees.isEmpty && tagsSelectionnes.isEmpty {
                                ZStack {
                                    VStack(spacing: 12) {
                                        Text("⭐️ Recommandés (Alternatives saines)")
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.horizontal)
                                            .padding(.top, 16)
                                        
                                        ForEach(restosSains) { restaurant in
                                            NavigationLink {
                                                RestaurantInfoDetails(restaurant: restaurant)
                                            } label: {
                                                RestaurantCard(restaurant: restaurant)
                                                    .padding(.horizontal)
                                            }
                                        }
                                        Spacer().frame(height: 10)
                                    }
                                }
                                .background(Color.green.opacity(0.15))
                                .cornerRadius(24)
                                .padding(.horizontal)
                                .padding(.bottom, 20)
                            }
                            
                            HStack {
                                Text("❤️ Top selon vos envies")
                                    .font(.headline)
                                    .padding(.vertical, 5)
                                    .padding(.leading)
                                Spacer()
                            }
                            
                            ForEach(resultatFiltres) { restaurant in
                                NavigationLink {
                                    RestaurantInfoDetails(restaurant: restaurant)
                                } label: {
                                    RestaurantCard(restaurant: restaurant)
                                        .foregroundStyle(.black)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                        .padding(.bottom, 80)
                    }
                }
            }
            .navigationTitle("Recherche")
            .searchable(text: $rechercheTexte, prompt: "Beef Art, Le Porthos..")
            .background(Color("BackgroundCream"))
        }
        .onAppear {
            setupCustomNavBar()
        }
    }
    
    /// Afficher le navigationTitle avec une police d'écriture personnalisée.
    func setupCustomNavBar() {
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.shadowColor = .clear

        
        standard.backgroundColor = UIColor(named: "BackgroundCream")?
            .withAlphaComponent(0.5)

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
    RechercheVue()
}
