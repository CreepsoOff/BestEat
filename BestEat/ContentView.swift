//
//  ContentView.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var ongletSelectionne = 0

    var body: some View {
        TabView(selection: $ongletSelectionne) {
            Tab("Suggestions", systemImage: "star.fill", value: 0) {
                OnBoarding()
                
            }
            Tab("Carte", systemImage: "map.fill", value: 1) {
                CarteVue(namespace: nil, showFullMap: nil)

            }
            Tab("Matching", systemImage: "heart.fill", value: 2) {
                MatchingVue()
                
            }
            Tab("Favoris", systemImage: "bookmark.fill", value: 3) {
                FavorisVue()
                
            }
            if ongletSelectionne == 0 || ongletSelectionne == 4 {
                Tab("Recherche", systemImage: "magnifyingglass", value: 4, role: .search) {
                    RechercheVue()
                }
            }
            
        }
        .tint(.deepOrange)
        
        
    }
}

#Preview {
    ContentView()
}


struct IsSearchable: ViewModifier {
    let ongletSelectionne: Int
    @Binding var rechercheTexte: String
    func body(content: Content) -> some View {
        if ongletSelectionne == 4 {
            content
                .searchable(text: $rechercheTexte)
        }        else {
            content


        }
    }
}

extension View{
    func isSearchable(ongletSelectionne: Int, rechercheTexte: Binding<String>) -> some View {
        modifier(IsSearchable(ongletSelectionne: ongletSelectionne, rechercheTexte: rechercheTexte))
    }
}
