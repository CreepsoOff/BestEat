//
//  MatchingVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI
import MapKit

struct MatchingVue: View {

    @State private var pileCartes: [Restaurant] = restaurants.shuffled()
    @State private var dragOffset: CGSize = .zero
    @State private var feedbackAction: Bool? = nil

    @State private var showPhotos = false
    @State private var showItinerairePicker = false

    private let seuilValidation: CGFloat = 120
    @Environment(\.openURL) private var openURL

    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()

                VStack {
                    Spacer(minLength: 10)

                    if pileCartes.isEmpty {
                        emptyStateView
                    } else {
                        swipeCardsZone
                           
                    }
                    
                    Spacer()
                    if let restaurant = pileCartes.first {
                        restaurantActionsBar(restaurant: restaurant)
                            .padding(.bottom, 10)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Matching")
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

    // MARK: - ZONE SWIPE

    private var swipeCardsZone: some View {
        ZStack {
            ForEach(pileCartes.prefix(3).reversed()) { restaurant in
                let isTopCard = restaurant.id == pileCartes.first?.id

                RestaurantMatch(
                    restaurant: restaurant,
                    offset: isTopCard ? dragOffset : .zero
                )
                .offset(x: isTopCard ? dragOffset.width : 0)
                .rotationEffect(.degrees(isTopCard ? Double(dragOffset.width / 20) : 0))
                .opacity(isTopCard ? (2 - Double(abs(dragOffset.width) / 150)) : 1)
                .scaleEffect(isTopCard ? 1 : getScale(for: restaurant))
                .offset(y: isTopCard ? 0 : getOffset(for: restaurant))
                .gesture(
                    isTopCard ?
                    DragGesture()
                        .onChanged { dragOffset = $0.translation }
                        .onEnded { _ in checkSwipeEnd() }
                    : nil
                )
                .allowsHitTesting(isTopCard)
            }

            if let isLike = feedbackAction {
                swipeFeedbackIcon(isLike)
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(.ultraThinMaterial.opacity(0.0))
        .padding(.horizontal)
    }

    // MARK: - BARRE ACTIONS RESTO

    private func restaurantActionsBar(restaurant: Restaurant) -> some View {
        VStack(spacing: 16) {

            MatchActionButtons(
                onPass: { triggerSwipe(liked: false) },
                onLike: { triggerSwipe(liked: true) }
            )
            .disabled(feedbackAction != nil)

            HStack(spacing: 28) {
                
                
                NavigationLink {
                    MenuVue(restaurant: restaurant)
                } label: {
                    actionIcon("Menu", systemImage: "doc.text")
                }

                Button {
                    showPhotos = true
                } label: {
                    actionIcon("Photos", systemImage: "camera")
                }
                .sheet(isPresented: $showPhotos) {
                    GaleriePhotosVue(restaurant: restaurant)
                }

                NavigationLink {
                    AvisVue(restaurant: restaurant)
                } label: {
                    actionIcon("Avis", systemImage: "star.bubble")
                }

                Button {
                    showItinerairePicker = true
                } label: {
                    actionIcon("Itinéraire", systemImage: "arrow.turn.up.right")
                }
                .confirmationDialog(
                    "Ouvrir l’itinéraire",
                    isPresented: $showItinerairePicker,
                    titleVisibility: .visible
                ) {
                    Button("Apple Plans") { openAppleMaps(restaurant) }
                    Button("Google Maps") { openGoogleMaps(restaurant) }
                    Button("Annuler", role: .cancel) {}
                }
            }
        }
        .padding(.top, 12)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
    }


    // MARK: - SWIPE LOGIC
    private func checkSwipeEnd() {
        if dragOffset.width > seuilValidation {
            triggerSwipe(liked: true)
        } else if dragOffset.width < -seuilValidation {
            triggerSwipe(liked: false)
        } else {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                dragOffset = .zero
            }
        }
    }

    private func triggerSwipe(liked: Bool) {
        withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
            feedbackAction = liked
        }

        withAnimation(.easeOut(duration: 0.4)) {
            dragOffset = CGSize(width: liked ? 1000 : -1000, height: 0)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            if let top = pileCartes.first,
               let index = restaurants.firstIndex(where: { $0.id == top.id }) {
                restaurants[index].isLiked = liked
            }

            withAnimation(.easeOut(duration: 0.6)) {
                dragOffset = .zero
            }

            withAnimation(.spring(response: 0.45, dampingFraction: 0.75)) {
                if !pileCartes.isEmpty {
                    pileCartes.removeFirst()
                }
                feedbackAction = nil
            }
        }
    }

    // MARK: - UI ELEMENTS

    private func actionIcon(_ title: String, systemImage: String) -> some View {
        VStack(spacing: 6) {
            Circle()
                .fill(Color("BrownText"))
                .frame(width: 52, height: 52)
                .overlay(
                    Image(systemName: systemImage)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                )

            Text(title)
                .font(.caption)
                .foregroundStyle(Color("BrownText"))
        }
    }

    private func swipeFeedbackIcon(_ isLike: Bool) -> some View {
        ZStack {
            Circle()
                .fill(isLike ? Color.midGreen : Color.lightRed)
                .frame(width: 120, height: 120)
                .shadow(radius: 10)

            Image(systemName: isLike ? "heart.fill" : "xmark")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(isLike ? .darkGreen : .darkRed)
        }
        .transition(.scale.combined(with: .opacity))
        .zIndex(10)
    }

    // MARK: - MAPS

    private func openAppleMaps(_ r: Restaurant) {
            let location = CLLocation(latitude: r.latitude, longitude: r.longitude)
            
            let address = MKAddress(fullAddress: r.adresse, shortAddress: nil)
            
            let mapItem = MKMapItem(location: location, address: address)
            mapItem.name = r.nom
            
            mapItem.openInMaps(launchOptions: [
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ])
        }

    private func openGoogleMaps(_ r: Restaurant) {
        let nomEncode = r.nom.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        if let urlApp = URL(string: "comgooglemaps://?q=\(r.latitude),\(r.longitude)(\(nomEncode))&directionsmode=driving"),
           UIApplication.shared.canOpenURL(urlApp) {
            UIApplication.shared.open(urlApp)
        }
        else if let urlWeb = URL(string: "https://www.google.com/maps/search/?api=1&query=\(r.latitude),\(r.longitude)") {
            UIApplication.shared.open(urlWeb)
        }
    }

    // MARK: - HELPERS

    private func getScale(for r: Restaurant) -> CGFloat {
        guard let i = pileCartes.firstIndex(where: { $0.id == r.id }) else { return 1 }
        return 1 - CGFloat(i) * 0.05
    }

    private func getOffset(for r: Restaurant) -> CGFloat {
        guard let i = pileCartes.firstIndex(where: { $0.id == r.id }) else { return 0 }
        return CGFloat(i) * 15
    }

    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "fork.knife.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(Color("BrownText").opacity(0.3))
            
            Text("Plus de restaurants !")
                .font(.custom("Redaction-Bold", size: 24))
                .foregroundStyle(Color("BrownText"))
            
            Button("Recommencer") {
                withAnimation { pileCartes = restaurants.shuffled() }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color("DeepOrange"))
            .foregroundColor(.white)
            .cornerRadius(30)
            .font(.custom("Redaction-Regular", size: 16))
        }
    }
}

#Preview {
    MatchingVue()
}
