//
//  RestaurantMatch.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct RestaurantMatch: View {
    let restaurant: Restaurant
    var onRemove: (Bool) -> Void
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            // Image
            GeometryReader { geo in
                if let imagePlat = restaurant.menu.first?.imagePlat {
                    Image(imagePlat)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } else {
                    Color.gray.opacity(0.3)
                }
            }
            
            // Dégradé
            LinearGradient(
                colors: [.black.opacity(0.9), .black.opacity(0.0)],
                startPoint: .bottom,
                endPoint: .center
            )
            
            // Infos
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(restaurant.nom)
                        .font(.custom("Redaction-Bold", size: 32))
                        .foregroundStyle(.white)
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill").font(.caption).foregroundColor(.yellow)
                        Text(String(format: "%.1f", restaurant.note))
                            .font(.callout).fontWeight(.bold).foregroundColor(.white)
                    }
                    .padding(.horizontal, 10).padding(.vertical, 6)
                    .background(.ultraThinMaterial).clipShape(Capsule())
                }
                
                Text(restaurant.desc)
                    .font(.subheadline).foregroundColor(.white.opacity(0.9)).lineLimit(2)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(restaurant.tag, id: \.self) { tag in
                            TagCapsule(tag: tag)
                        }
                    }
                }
            }
            .padding(24).padding(.bottom, 10)
            
            // Feedback DRAG MANUEL (Swipe doigt)
            // Cela s'affiche uniquement quand on tire la carte avec le doigt
            if offset.width > 50 {
                visuelLike.opacity(Double(offset.width / 150))
            } else if offset.width < -50 {
                visuelNope.opacity(Double(abs(offset.width) / 150))
            }
        }
        .background(Color.white)
        .cornerRadius(32)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
        
        // Logique Geste Doigt
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .offset(x: offset.width, y: offset.height * 0.4)
        .opacity(2 - Double(abs(offset.width) / 150))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if offset.width > 150 {
                        onRemove(true)
                    } else if offset.width < -150 {
                        onRemove(false)
                    } else {
                        withAnimation(.spring()) { offset = .zero }
                    }
                }
        )
    }
    
    private var visuelLike: some View {
        Image(systemName: "heart.circle.fill")
            .resizable().frame(width: 80, height: 80)
            .foregroundColor(.green).background(Circle().fill(.white))
            .opacity(0.8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    private var visuelNope: some View {
        Image(systemName: "xmark.circle.fill")
            .resizable().frame(width: 80, height: 80)
            .foregroundColor(.red).background(Circle().fill(.white))
            .opacity(0.8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
