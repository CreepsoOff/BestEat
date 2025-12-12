import SwiftUI

struct MonProfilVue: View {
    
    @State private var halal = true
    @State private var vegetarien = true
    @State private var cacher = false
    @State private var vegan = true
    
    @State private var emotionChoisi: String? = nil
    
    let emotions = ["😂", "😄", "🙂", "😭", "😢", "😡"]
    
    
    let accentColor = Color(red: 0.65, green: 0.45, blue: 0.15)
    let backgroundColor = Color(red: 0.98, green: 0.96, blue: 0.92)
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    Text("Mon profil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(accentColor)
                        .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Prix 😊")
                            .font(.headline)
                            .foregroundColor(accentColor)
                        
                        HStack {
                            VStack {
                                Text("MINIMUM")
                                    .font(.caption)
                                Text("20€")
                                    .font(.title3)
                                    .fontWeight(.medium)
                            }
                            .padding(15)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                            )
                            
                            Spacer()
                                .frame(width: 20)
                            
                            VStack {
                                Text("MAXIMUM")
                                    .font(.caption)
                                Text("200€")
                                    .font(.title3)
                                    .fontWeight(.medium)
                            }
                            .padding(15)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Régime 😊")
                            .font(.headline)
                            .foregroundColor(accentColor)
                        
                        VStack(spacing: 10) {
                            Toggle("Halal", isOn: $halal)
                            Toggle("Végétarien", isOn: $vegetarien)
                            Toggle("Cacher", isOn: $cacher)
                            Toggle("Végétalien (Vegan)", isOn: $vegan)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                        )
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Émotion:")
                            .font(.headline)
                            .foregroundColor(accentColor)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 30) {
                            ForEach(["😂", "😄", "🙂", "😭", "😢", "😡"], id: \.self) { emoji in
                                Button(action: {
                                    emotionChoisi = emoji
                                }) {
                                    Text(emoji)
                                        .font(.system(size: 50))
                                        .scaleEffect(emotionChoisi == emoji ? 1.3 : 1.0)
                                        .animation(.spring(response: 0.3), value: emotionChoisi)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    NavigationLink {
                        RestaurantsVisitesVue()
                    } label: {
                        Circle()
                            .fill(accentColor) // Couleur marron/bronze
                            .frame(width: 60, height: 60)
                            .overlay(
                                Image(systemName: "book.fill")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            )
                    }
                    .padding(.bottom, 30)
                }
            }
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
            .navigationTitle("")
        }
    }
}

#Preview {
    MonProfilVue()
}
