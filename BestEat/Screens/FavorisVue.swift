import SwiftUI

struct FavorisVue: View {
    
    

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {

                NavigationLink {
                    RestaurantInfoDetails(restaurant: restaurants[8])
                } label: {
                    Text("InfoDetails")
                }

                VStack(spacing: 20) {

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(plats) { plat in
                            PlatsDetailsROw(plat: plat)
                        }
                        
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Mes favoris")
                                .font(.custom("Redaction-Regular", size: 32))
                                .foregroundStyle(.brownText)
                                .padding(.top, 10)
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                MonProfilVue()
                            } label: {
                                Image(systemName: "person.fill")
                                    .foregroundStyle(.brownText)
                            }
                        }
                    }
                    
                    .padding(.horizontal)
                }
            }
            
        }
        
    }
}

#Preview {
    FavorisVue()
}
