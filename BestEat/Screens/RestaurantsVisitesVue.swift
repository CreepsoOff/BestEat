import SwiftUI





struct CustomNavBar: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                
                Spacer()
                
                Text("Restaurants visités")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.65, green: 0.45, blue: 0.15))
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 24)
            .padding(.bottom, 16)
        }
        .background(Color(red: 0.98, green: 0.96, blue: 0.92))
        .shadow(radius: 1)
    }
}


//
//  RestaurantsVisitesVue.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

// --- GRID ITEM CORRIGÉ ---
struct RestaurantGridItem: View {
    
    @Binding var resto: Restaurant
    let imageWidth: CGFloat = 160
    
    var body: some View {
        VStack(spacing: 5) {
            
            Text(resto.nom)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(Color(red: 0.35, green: 0.2, blue: 0.1))
                .padding(.top, 5)
            
            ZStack(alignment: .topTrailing) {
                Image(resto.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: imageWidth * 0.75)
                    .clipped()
                
                // BOUTON LIKE - Modifie isLiked directement
                Button {
                    withAnimation {
                        resto.isLiked.toggle()
                    }
                } label: {
                    Image(systemName: resto.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(resto.isLiked ? .red : .white)
                        .padding(8)
                        .background(.black.opacity(0.3))
                        .clipShape(Circle())
                        
                }
                .padding(5)
            }
            
            // SYSTEME DE NOTATION PERSONNEL
            // Ici, on affiche resto.noteEtoile (la note de l'utilisateur)
            // Et non pas resto.note (la note globale du restaurant)
            HStack(spacing: 3) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= resto.noteEtoile ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                        .font(.title3)
                        .onTapGesture {
                            // On met à jour UNIQUEMENT la note personnelle
                            resto.noteEtoile = index
                        }
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: imageWidth)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

// --- VUE PRINCIPALE ---
struct RestaurantsVisitesVue: View {
    
    // On utilise @State pour pouvoir modifier les propriétés locales (isLiked, noteEtoile)
    // IMPORTANT: On initialise avec les données globales, mais les changements ici sont locaux à cette vue
    // tant qu'on ne propage pas via un Binding ou un ViewModel.
    // Dans ce contexte simple, cela fonctionne pour la session.
    @State var restaurantsModifiables: [Restaurant] = restaurants
    
    // FILTRE : On ne garde que ceux qui sont visités
    var listResto: [Restaurant] {
        restaurantsModifiables.filter { $0.estVisite == true }
    }
    
    var body: some View {
        ZStack {
            // Fond crème global
            Color("BackgroundCream").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    
                    // Espacement pour la navbar custom
                    Spacer().frame(height: 60)
                    
                    if listResto.isEmpty {
                        ContentUnavailableView("Aucune visite", systemImage: "fork.knife", description: Text("Visitez des restaurants pour les noter ici."))
                            .padding(.top, 100)
                    } else {
                        // GRILLE MANUELLE (Conservation de votre logique de grille)
                        let numberOfRows = (listResto.count + 1) / 2
                        
                        ForEach(0..<numberOfRows, id: \.self) { rowIndex in
                            
                            let firstIndex = rowIndex * 2
                            let secondIndex = rowIndex * 2 + 1
                            
                            HStack(spacing: 15) {
                                // Premier item
                                if firstIndex < listResto.count {
                                    // On doit retrouver l'index dans le tableau source @State pour le Binding
                                    if let sourceIndex = restaurantsModifiables.firstIndex(where: { $0.id == listResto[firstIndex].id }) {
                                        RestaurantGridItem(resto: $restaurantsModifiables[sourceIndex])
                                    }
                                }
                                
                                // Deuxième item
                                if secondIndex < listResto.count {
                                    if let sourceIndex = restaurantsModifiables.firstIndex(where: { $0.id == listResto[secondIndex].id }) {
                                        RestaurantGridItem(resto: $restaurantsModifiables[sourceIndex])
                                    }
                                } else {
                                    Spacer().frame(width: 160) // Placeholder pour l'alignement
                                }
                            }
                        }
                    }
                }
                .padding()
                .padding(.bottom, 80)
            }
        }
        .overlay(
            CustomNavBar()
            , alignment: .top
        )
        .navigationBarHidden(true) // On cache la navbar native car on a CustomNavBar
    }
}

#Preview {
    RestaurantsVisitesVue()
}
