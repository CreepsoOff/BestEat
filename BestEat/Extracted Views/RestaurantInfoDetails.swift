//
//  RestaurantInfoDetails.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI
import MapKit

struct RestaurantInfoDetails: View {
    
    let restaurant: Restaurant
    @State private var showItinerairePicker = false
    
    // Pour mettre en évidence le jour actuel (optionnel)
    private var jourActuel: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "fr_FR")
        f.dateFormat = "EEEE" // "lundi", "mardi"...
        return f.string(from: Date()).capitalized
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 25) {
                    
                    // --- IMAGE ---
                    Image(restaurant.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    // --- TITRE ---
                    Text(restaurant.nom)
                        .font(.custom("Redaction-Bold", size: 32))
                        .foregroundStyle(Color("BrownText"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // --- BLOC CONTACT & HORAIRES ---
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // TÉLÉPHONE
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundStyle(Color("DeepOrange"))
                                .frame(width: 24)
                            Text("03 20 34 35 22")
                                .font(.custom("Redaction-Regular", size: 18))
                                .foregroundStyle(Color("BrownText"))
                        }
                        
                        Divider()
                        
                        // HORAIRES DÉTAILLÉS
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundStyle(Color("DeepOrange"))
                                    .frame(width: 24)
                                Text("Horaires d'ouverture")
                                    .font(.custom("Redaction-Bold", size: 18))
                                    .foregroundStyle(Color("BrownText"))
                            }
                            .padding(.bottom, 4)
                            
                            // BOUCLE SUR LES HORAIRES
                            // On suppose que HoraireOuvertureItem est Identifiable ou on utilise id: \.jour
                            ForEach(restaurant.horaireOuverture.horaires, id: \.jour) { item in
                                HStack {
                                    // Nom du jour
                                    Text(item.jour.rawValue.capitalized)
                                        .font(.custom("Redaction-Regular", size: 16))
                                        .foregroundStyle(Color("BrownText"))
                                        .frame(width: 100, alignment: .leading) // Largeur fixe pour aligner
                                    
                                    Spacer()
                                    
                                    // Heures
                                    Text(item.horaire)
                                        .font(.custom("Redaction-Regular", size: 16))
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical, 2)
                                // Petit bonus : fond léger si c'est le jour d'aujourd'hui (dépend du nommage de ton enum Jour)
                                .background(
                                    item.jour.rawValue.capitalized == jourActuel
                                    ? Color("DeepOrange").opacity(0.1)
                                    : Color.clear
                                )
                                .cornerRadius(4)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    // --- BLOC ADRESSE & TRANSPORT ---
                    VStack(alignment: .leading, spacing: 15) {
                        
                        // Adresse
                        HStack(alignment: .top) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundStyle(Color("DeepOrange"))
                                .frame(width: 24)
                            
                            Text(restaurant.adresse)
                                .font(.custom("Redaction-Regular", size: 18))
                                .foregroundStyle(Color("BrownText"))
                        }
                        
                        Divider()
                        
                        // Transports
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Accès transports")
                                .font(.custom("Redaction-Bold", size: 16))
                                .foregroundStyle(Color("BrownText"))
                            
                            HStack {
                                Image(systemName: "tram.fill")
                                    .frame(width: 20)
                                Text("Métro Ligne 1 : Rihour")
                            }
                            .font(.custom("Redaction-Regular", size: 14))
                            .foregroundStyle(.gray)
                            
                            HStack {
                                Image(systemName: "tram")
                                    .frame(width: 20)
                                Text("Métro Ligne 1 & 2 : Lille Flandres")
                            }
                            .font(.custom("Redaction-Regular", size: 14))
                            .foregroundStyle(.gray)
                        }
                        
                        Divider()
                        
                        // BOUTON ITINÉRAIRE
                        Button {
                            showItinerairePicker = true
                        } label: {
                            HStack {
                                Spacer()
                                Text("Y aller")
                                    .font(.custom("Redaction-Bold", size: 18))
                                Image(systemName: "arrow.turn.up.right")
                                Spacer()
                            }
                            .padding()
                            .background(Color("BrownText"))
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 40)
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Infos pratiques")
                    .font(.custom("Redaction-Regular", size: 28))
                    .foregroundStyle(Color("BrownText"))
                    .padding(.top, 10)
            }
        }
        .confirmationDialog("Ouvrir l’itinéraire", isPresented: $showItinerairePicker, titleVisibility: .visible) {
            Button("Apple Plans") { openAppleMaps(restaurant) }
            Button("Google Maps") { openGoogleMaps(restaurant) }
            Button("Annuler", role: .cancel) {}
        }
    }
    
    // MARK: - FONCTIONS MAPS
    
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
        } else if let urlWeb = URL(string: "https://www.google.com/maps/search/?api=1&query=\(r.latitude),\(r.longitude)") {
            UIApplication.shared.open(urlWeb)
        }
    }
}

#Preview {
    NavigationStack {
        RestaurantInfoDetails(restaurant: restaurants[0])
    }
}
