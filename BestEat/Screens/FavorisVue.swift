import SwiftUI

struct FavorisVue: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
    ]
    
    var platsFavoris: [(resto: Restaurant, plat: Plat)] {
        var liste: [(Restaurant, Plat)] = []
        
        for resto in restaurants {
            if resto.estVisite {
                for plat in resto.menu {
                    if plat.isFavori {
                        liste.append((resto, plat))
                    }
                }
            }
        }
        return liste
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                if platsFavoris.isEmpty {
                    
                    // --- CAS : AUCUN FAVORI ---
                    VStack(spacing: 20) {
                        Image(systemName: "fork.knife.circle")
                            .font(.system(size: 70))
                            .foregroundStyle(Color("BrownText").opacity(0.5))
                        
                        Text("Aucun coup de cœur ?")
                            .font(.custom("Redaction-Bold", size: 24))
                            .foregroundStyle(Color("BrownText"))
                        
                        Text("Visitez des restaurants et ajoutez des plats à vos favoris pour les retrouver ici.")
                            .font(.custom("Redaction-Regular", size: 16))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    
                    // --- CAS : LISTE DES FAVORIS ---
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            Spacer()
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(platsFavoris, id: \.plat.id) { item in

                                    NavigationLink {
                                        RestaurantInfoDetails(restaurant: item.resto)
                                    } label: {
                                        SuggestionCard(plat: item.plat)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mes plats favoris")
                        .font(.custom("Redaction-Regular", size: 32))
                        .foregroundStyle(Color("BrownText"))
                        .padding(.top, 10)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MonProfilVue()
                    } label: {
                        Image(systemName: "person.fill")
                            .foregroundStyle(Color("BrownText"))
                    }
                }
            }
        }
    }
}

#Preview {
    FavorisVue()
}
