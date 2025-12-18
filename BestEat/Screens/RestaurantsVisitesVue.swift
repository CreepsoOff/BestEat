import SwiftUI

// --- GRID ITEM ---
struct RestaurantGridItem: View {
    @Binding var resto: Restaurant
    let imageWidth: CGFloat = 160
    
    var body: some View {
        VStack(spacing: 5) {
            Text(resto.nom)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(Color("BrownText"))
                .padding(.top, 5)
            
            ZStack(alignment: .topTrailing) {
           
                    Image(resto.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageWidth * 0.75)
                        .clipped()
                
                
                // BOUTON LIKE
                Button {
                    withAnimation {
                        resto.isLiked.toggle()
                    }
                } label: {
                    Image(systemName: resto.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(resto.isLiked ? .red : .white)
                        .padding(8)
                        .background(.black.opacity(0.4))
                        .clipShape(Circle())
                }
                .padding(6)
            }
            .cornerRadius(12)
            

        }
        .frame(width: imageWidth)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 3)
    }
}

// --- VUE PRINCIPALE ---
struct RestaurantsVisitesVue: View {
    
    @State private var restaurantsModifiables: [Restaurant] = restaurants
    
    var listResto: [Restaurant] {
        restaurantsModifiables.filter { $0.estVisite }
    }
    
    let colonnes = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                
                if listResto.isEmpty {
                    ContentUnavailableView(
                        "Aucune visite",
                        systemImage: "fork.knife.circle",
                        description: Text("Marquez des restaurants comme 'Visités' pour les voir ici.")
                    )
                    .padding(.top, 100)
                    .foregroundStyle(Color("BrownText"))
                } else {
                    LazyVGrid(columns: colonnes, spacing: 25) {
                        ForEach($restaurantsModifiables) { $resto in
                            if resto.estVisite {
                                RestaurantGridItem(resto: $resto)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Restaurants visités")
                    .font(.custom("Redaction-Regular", size: 32))
                
                    .foregroundStyle(Color("BrownText"))
                    .padding(.top, 10)
            }
        }
        .onAppear {
            setupNavBarAppearance()
        }
    }
    
    func setupNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BackgroundCream")
        appearance.shadowColor = .clear
        
        
        let transparentAppearance = UINavigationBarAppearance()
        transparentAppearance.configureWithTransparentBackground()
        transparentAppearance.backgroundColor = .clear
        
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = transparentAppearance
        
        UINavigationBar.appearance().compactAppearance = appearance
        
        
        UINavigationBar.appearance().tintColor = UIColor(named: "BrownText")
    }
}

#Preview {
    NavigationStack {
        RestaurantsVisitesVue()
    }
}
