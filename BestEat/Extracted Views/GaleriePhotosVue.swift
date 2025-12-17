//
//  GaleriePhotosVue.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI
struct GaleriePhotosVue: View {
    let restaurant: Restaurant
        @Environment(\.dismiss) var dismiss
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                ScrollView {
                    if restaurant.menu.isEmpty {
                        ContentUnavailableView("Pas de photos", systemImage: "photo")
                            .padding(.top, 50)
                    } else {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                            ForEach(restaurant.menu) { plat in
                                VStack {
                                    Image(plat.imagePlat)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 150)
                                        .clipped()
                                        .cornerRadius(12)
                                    
                                    Text(plat.nomPlat)
                                        .font(.caption).bold()
                                        .foregroundStyle(Color("BrownText"))
                                        .lineLimit(1)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Photos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Fermer") { dismiss() }.foregroundStyle(Color("DeepOrange"))
                }
            }
        }
    }
}


#Preview {
    GaleriePhotosVue(restaurant: restaurants[2])
}
