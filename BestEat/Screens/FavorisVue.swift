//
//  tagtraining.swift
//  BestHEAT
//
//  Created by apprenant96 on 11/12/2025.
//

import SwiftUI

struct FavorisVue: View {
    
    // 2 colonnes régulières
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(plats) { plat in
                            
                            VStack(spacing: 10) {
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.orange.opacity(0.2))
                                    .frame(height: 100)
                                    .overlay(
                                        Image(plat.imagePlat)
                                            .frame(width:100, height: 80 )
                                    )
                                
                                VStack(spacing: 6) {
                                    
                                    // TEXTE UNIQUE PAR ITEM
                                    Text(plat.nomPlat)
                                        .font(.headline)
                                    
                                    // BOUTON SOUS L’ITEM
                                    HStack {
                                        Button(action: {
                                            print("Bouton tapé pour : \(plat.nomPlat)")
                                        }) {
                                            Text("Action")
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(Color.orange.opacity(0.8))
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }

                                        Button(action: {
                                            print("Bouton tapé pour : \(plat.nomPlat)")
                                        }) {
                                            Text("Action")
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 8)
                                                .background(Color.orange.opacity(0.8))
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
        }
        .navigationBarTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Mes Favoris")
                
            }
        }
    }
}

#Preview {
    FavorisVue()
}
