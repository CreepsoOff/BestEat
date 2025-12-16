//
//  MatchingVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct MatchingVue: View {
    
    @State private var pileCartes: [Restaurant] = restaurants.shuffled()
    
    @State private var feedbackAction: Bool? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    if pileCartes.isEmpty {
                        emptyStateView
                    } else {
                        // --- Zone des Cartes ---
                        ZStack {
                            // Les Cartes
                            ForEach(pileCartes.prefix(3).reversed()) { restaurant in
                                RestaurantMatch(
                                    restaurant: restaurant,
                                    onRemove: { liked in
                                        swipeCard(restaurant: restaurant, liked: liked)
                                    }
                                )
                                .scaleEffect(getScale(for: restaurant))
                                .offset(y: getOffset(for: restaurant))
                                .allowsHitTesting(restaurant.id == pileCartes.first?.id)
                            }
                            
                            // --- FEEDBACK VISUEL (Overlay Bouton) ---
                            // S'affiche par dessus les cartes quand on clique sur un bouton
                            if let isLike = feedbackAction {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 120, height: 120)
                                        .shadow(radius: 10)
                                    
                                    Image(systemName: isLike ? "heart.fill" : "xmark")
                                        .font(.system(size: 60, weight: .bold))
                                        .foregroundColor(isLike ? .green : .red)
                                }
                                .transition(.scale.combined(with: .opacity))
                                .zIndex(10)
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 520)
                        .zIndex(1)
                        
                        // --- Boutons ---
                        MatchActionButtons(
                            onPass: { triggerSwipe(liked: false) },
                            onLike: { triggerSwipe(liked: true) }
                        )
                        .padding(.top, 40)
                        // Désactive les boutons pendant l'animation pour éviter les bugs
                        .disabled(feedbackAction != nil)
                    }
                    
                    Spacer()
                    Spacer().frame(height: 40)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Matching")
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
        }
    }
    
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "fork.knife.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.brownText.opacity(0.3))
            
            Text("Plus de restaurants !")
                .font(.custom("Redaction-Bold", size: 24))
                .foregroundStyle(.brownText)
            
            Button("Recommencer") {
                withAnimation {
                    pileCartes = restaurants.shuffled()
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color("DeepOrange"))
            .foregroundColor(.white)
            .cornerRadius(30)
        }
    }
    
    private func triggerSwipe(liked: Bool) {
        
        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
            feedbackAction = liked
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            
            if let topRestaurant = pileCartes.first {
                withAnimation(.easeIn(duration: 0.4)) {
                    swipeCard(restaurant: topRestaurant, liked: liked)
                }
            }
            
            withAnimation(.easeOut(duration: 0.2)) {
                feedbackAction = nil
            }
        }
    }
    
    private func swipeCard(restaurant: Restaurant, liked: Bool) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants[index].isLiked = liked
            print(liked ? "❤️ Liké: \(restaurant.nom)" : "❌ Passé: \(restaurant.nom)")
        }
        
        pileCartes.removeAll { $0.id == restaurant.id }
    }
    
    private func getScale(for restaurant: Restaurant) -> CGFloat {
        guard let index = pileCartes.firstIndex(where: { $0.id == restaurant.id }) else { return 1.0 }
        return 1.0 - (CGFloat(index) * 0.05)
    }
    
    private func getOffset(for restaurant: Restaurant) -> CGFloat {
        guard let index = pileCartes.firstIndex(where: { $0.id == restaurant.id }) else { return 0 }
        return CGFloat(index) * 15
    }
}

#Preview {
    MatchingVue()
}
