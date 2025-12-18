//
//  CarteVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import MapKit
import SwiftUI

struct CarteVue: View {
    
    var namespace: Namespace.ID?
    var showFullMap: Binding<Bool>?
    
    // --- ÉTAT ---
    // Lille
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        )
    )
    
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                
                // --- MAP ---
                Map(position: $position) {
                    ForEach(restaurants) { restaurant in
                        Annotation(
                            "",
                            coordinate: CLLocationCoordinate2D(
                                latitude: restaurant.latitude,
                                longitude: restaurant.longitude
                            )
                        ) {
                            CustomMapPin(restaurant: restaurant, isSelected: selectedRestaurant?.id == restaurant.id)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedRestaurant = restaurant
                                    }
                                }
                        }
                    }
                }
                .mapControls {
                    MapCompass()
                    MapScaleView()
                }
                .ignoresSafeArea()
            }
            // --- BARRE DE NAVIGATION ---
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Carte")
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
            // --- LA SHEET ---
            .sheet(item: $selectedRestaurant) { restaurant in
                NavigationStack {
                    RestaurantInfoDetails(restaurant: restaurant)
                        .toolbar {
                                        ToolbarItem(placement: .topBarTrailing) {
                                            Button {
                                                selectedRestaurant = nil
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .font(.system(size: 18))
                                            }
                                            .buttonStyle(.glassProminent)
                                        }
                                    }
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(25)
            }
        }
    }
}



#Preview {
    CarteVue()
}
