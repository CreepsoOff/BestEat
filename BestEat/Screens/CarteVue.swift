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
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 50.6333,
                longitude: 3.0667
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        )
    )
    
    var body: some View {
        // 1. On ajoute NavigationStack pour que la toolbar et le lien fonctionnent
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                
                // MAP
                VStack {
                    Group {
                        if let namespace {
                            Map(position: $position) {
                                ForEach(restaurants) { restaurant in
                                    annotation(pour: restaurant)
                                }
                            }
                            .matchedGeometryEffect(id: "map", in: namespace)
                        } else {
                            Map(position: $position) {
                                ForEach(restaurants) { restaurant in
                                    annotation(pour: restaurant)
                                }
                            }
                        }
                    }
                }
                .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Carte") // Vous pouvez changer par "Carte" si vous préférez
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
    
    func annotation(pour restaurant: Restaurant) -> Annotation<Text, some View> {
        Annotation(
            restaurant.nom,
            coordinate: CLLocationCoordinate2D(
                latitude: restaurant.latitude,
                longitude: restaurant.longitude
            )
        ) {
            VStack {
                Image(systemName: "fork.knife.circle.fill")
                    .foregroundColor(.red)
                    .font(.title2)
                
                Text(restaurant.nom)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(3)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(5)
            }
            .shadow(radius: 3)
        }
    }
}

#Preview {
    CarteVue(
        namespace: nil,
        showFullMap: nil
    )
}
