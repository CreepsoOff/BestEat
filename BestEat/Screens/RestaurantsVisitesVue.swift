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
            .padding(.top, 50)
            .padding(.bottom, 10)
        }
        .background(Color(red: 0.98, green: 0.96, blue: 0.92))
        .shadow(radius: 1)
    }
}


struct RestaurantGridItem: View {
    
    @Binding var resto: Restaurant
    let imageWidth: CGFloat = 160
    @State var rating = 0
    
    var body: some View {
        VStack(spacing: 5) {
            
            
            Text(resto.nom)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(Color(red: 0.35, green: 0.2, blue: 0.1))
                .padding(.top, 5)
            
            
            Image(resto.image)
                .resizable()
                .scaledToFill()
                .frame(width: imageWidth, height: imageWidth * 0.75)
                .clipped()
            
            Button {
                resto.isLiked.toggle()
            } label: {
                Image(systemName: resto.isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(resto.isLiked ? .red : .gray)
            }
            .padding(.vertical, 5)
            
            HStack(spacing: 3) {
                ForEach(1...5, id: \.self) { index in
                    EtoileExtracted(index: index, rating: resto.note)
                        .onTapGesture {
                            resto.noteEtoile = index
                            
                            
                            resto.note = Double(index)
                        }
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: imageWidth)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 2)
    }
}



struct RestaurantsVisitesVue: View {
    
    
    @State var restaurantsModifiables: [Restaurant] = restaurants
    
    var listResto: [Restaurant] {
        restaurantsModifiables.filter{$0.estVisite == true}
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                
                let numberOfRows = (listResto.count + 1) / 2
                
                ForEach(0..<numberOfRows, id: \.self) { rowIndex in
                    
                    let firstIndex = rowIndex * 2
                    let secondIndex = rowIndex * 2 + 1
                    
                    HStack(spacing: 10) {
                        
                        if firstIndex < listResto.count {
                            
                            if let globalIndex = restaurantsModifiables.firstIndex(where: { $0.id == listResto[firstIndex].id }) {
                                RestaurantGridItem(resto: $restaurantsModifiables[globalIndex])
                            }
                        }
                        
                        
                        if secondIndex < listResto.count {
                            if let globalIndex = restaurantsModifiables.firstIndex(where: { $0.id == listResto[secondIndex].id }) {
                                RestaurantGridItem(resto: $restaurantsModifiables[globalIndex])
                            }
                        } else {
                            
                            Spacer()
                                .frame(width: 160)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(red: 0.98, green: 0.96, blue: 0.92).edgesIgnoringSafeArea(.all))
        
        .overlay(
            CustomNavBar()
                .edgesIgnoringSafeArea(.top)
            , alignment: .top
        )
    }
}

#Preview {
    RestaurantsVisitesVue()
}
