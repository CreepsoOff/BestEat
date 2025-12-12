//
//  CarteVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI
import MapKit

struct CarteVue: View {
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667),
            span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
        )
    )
    
    var body: some View {
        NavigationStack {
            Map(position: $position) {
                
                ForEach(restaurants) { restaurant in
                    Annotation(restaurant.nom, coordinate: CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)) {
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
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Carte")
                        .font(.custom("Redaction-Regular", size: 32))
                }
            }
            .mapControls {
                MapCompass()
                MapPitchToggle()
            }
        }
    }
}

#Preview {
    CarteVue()
}
