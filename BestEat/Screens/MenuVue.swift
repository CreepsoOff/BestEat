//
//  MenuVue.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI

struct MenuVue: View {
    let restaurant: Restaurant

    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 25) {
                    
                    ForEach(restaurant.menu) { plat in
                        
                        HStack(alignment: .center, spacing: 5) {
                            
                            // 1. IMAGE PENCHÉE
                            Image(plat.imagePlat)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 140)
                                .cornerRadius(20)
                                .rotationEffect(.degrees(-10))
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 2, y: 4)
                                .zIndex(1)
                            
                            // 2. CARTE TEXTE
                            VStack(alignment: .leading, spacing: 8) {
                                Text(plat.nomPlat)
                                    .font(.custom("Redaction-Bold", size: 18))
                                    .foregroundStyle(Color("BrownText"))
                                    .lineLimit(2)
                                
                                Text(plat.descriptionPlat)
                                    .font(.custom("Redaction-Regular", size: 14))
                                    .foregroundStyle(.gray)
                                    .lineLimit(4)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .frame(height: 130)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                            .rotationEffect(.degrees(5))
                            

                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Menu")
                    .font(.custom("Redaction-Regular", size: 32))
                    .foregroundStyle(Color("BrownText"))
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuVue(restaurant: restaurants[0])
    }
}
