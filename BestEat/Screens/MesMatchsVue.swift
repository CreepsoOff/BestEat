import SwiftUI

struct MesMatchsVue: View {
    
    // On filtre la liste globale pour ne garder que ceux qui sont isLiked
    var matchs: [Restaurant] {
        return restaurants.filter { $0.isLiked }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()
            
            if matchs.isEmpty {
                // --- CAS : PAS ENCORE DE MATCHS ---
                VStack(spacing: 15) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 60))
                        .foregroundStyle(Color("BrownText").opacity(0.4))
                    
                    Text("Pas encore de coups de cœur ?")
                        .font(.custom("Redaction-Bold", size: 22))
                        .foregroundStyle(Color("BrownText"))
                    
                    Text("Likez des restaurants pour les retrouver ici.")
                        .font(.custom("Redaction-Regular", size: 16))
                        .foregroundStyle(.gray)
                }
            } else {
                // --- CAS : LISTE DES MATCHS ---
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(matchs) { restaurant in
                            NavigationLink {
                                RestaurantInfoDetails(restaurant: restaurant)
                            } label: {
                                MatchCard(restaurant: restaurant)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Mes Matchs")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack {
        MesMatchsVue()
    }
}
