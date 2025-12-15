//
//  CarteVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI
import MapKit

struct CarteVue: View {

    var namespace: Namespace.ID?
    var showFullMap: Binding<Bool>?

    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        )
    )

    var body: some View {
        ZStack(alignment: .topTrailing) {

            // MAP
            Group {
                if let namespace {
                    Map(position: $position) {

                        ForEach(restaurants) { restaurant in
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
                    .matchedGeometryEffect(id: "map", in: namespace)
                } else {
                    Map(position: $position) {

                        ForEach(restaurants) { restaurant in
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
                }
            }
            .ignoresSafeArea()

            // BOUTON FERMER (uniquement en overlay)
            if let showFullMap = showFullMap {
                Button {
                    withAnimation(.smooth(duration: 0.45)) {
                        showFullMap.wrappedValue = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    CarteVue(
        namespace: nil,
        showFullMap: nil
    )
}
