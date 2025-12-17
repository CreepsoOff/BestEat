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
    
    private var jourActuel: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "fr_FR")
        f.dateFormat = "EEEE"
        return f.string(from: Date()).capitalized
    }
    
    var body: some View {
        
        // MARK: VSTACK
        VStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 25) {
                        ZStack {
                            Color.gray.opacity(0.1)
                            
                            Image(restaurant.image)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: 370)
                                .frame(height: 250)
                                .clipped()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        
                        // --- 2. TITRE ---
                        Text(restaurant.nom)
                            .font(.custom("Redaction-Bold", size: 32))
                            .foregroundStyle(Color("BrownText"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // --- 3. STATUT VISITÉ ---
                        HStack {
                            Image(systemName: restaurant.estVisite ? "checkmark.seal.fill" : "clock.fill")
                                .foregroundStyle(restaurant.estVisite ? .green : .orange)
                            
                            Text(restaurant.estVisite ? "Déjà visité" : "Pas encore visité")
                                .font(.custom("Redaction-Bold", size: 18))
                                .foregroundStyle(Color("BrownText"))
                            
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // --- 4. À PROPOS ---
                        VStack(alignment: .leading, spacing: 10) {
                            Text("À propos")
                                .font(.custom("Redaction-Bold", size: 20))
                                .foregroundStyle(Color("BrownText"))
                            
                            Text(restaurant.desc)
                                .font(.custom("Redaction-Regular", size: 16))
                                .foregroundStyle(Color.gray)
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // --- 5. CONTACT & HORAIRES ---
                        VStack(alignment: .leading, spacing: 20) {
                            // Tél
                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundStyle(Color("DeepOrange"))
                                    .frame(width: 24)
                                Text("03 20 34 35 22")
                                    .font(.custom("Redaction-Regular", size: 18))
                                    .foregroundStyle(Color("BrownText"))
                            }
                            
                            Divider()
                            
                            // Horaires
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
                                
                                ForEach(restaurant.horaireOuverture.horaires, id: \.jour) { item in
                                    HStack {
                                        Text(item.jour.rawValue.capitalized)
                                            .font(.custom("Redaction-Regular", size: 16))
                                            .foregroundStyle(Color("BrownText"))
                                            .frame(width: 100, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        Text(item.horaire)
                                            .font(.custom("Redaction-Regular", size: 16))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8) // Petit espace pour le surlignage
                                    .background(
                                        item.jour.rawValue.capitalized == jourActuel
                                        ? Color("DeepOrange").opacity(0.15)
                                        : Color.clear
                                    )
                                    .cornerRadius(6)
                                }
                            }
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // --- 6. ADRESSE & TRANSPORTS ---
                        VStack(alignment: .leading, spacing: 15) {
                            // Adresse
                            HStack(alignment: .top) {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundStyle(Color("DeepOrange"))
                                    .frame(width: 24)
                                
                                Text(restaurant.adresse)
                                    .font(.custom("Redaction-Regular", size: 18))
                                    .foregroundStyle(Color("BrownText"))
                                    .fixedSize(horizontal: false, vertical: true)
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
                                        .foregroundStyle(Color("DeepOrange"))
                                    Text("Métro Ligne 1 : Rihour")
                                }
                                .font(.custom("Redaction-Regular", size: 14))
                                .foregroundStyle(.gray)
                                
                                HStack {
                                    Image(systemName: "tram")
                                        .frame(width: 20)
                                        .foregroundStyle(Color("DeepOrange"))
                                    Text("Métro Ligne 1 & 2 : Lille Flandres")
                                }
                                .font(.custom("Redaction-Regular", size: 14))
                                .foregroundStyle(.gray)
                            }
                            
                            Divider()
                            
                            // Bouton GPS
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
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        
                        // --- 7. APERÇU MENU ---
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Aperçu du menu")
                                    .font(.custom("Redaction-Bold", size: 20))
                                    .foregroundStyle(Color("BrownText"))
                                Spacer()
                                NavigationLink {
                                    MenuVue(restaurant: restaurant)
                                } label: {
                                    Text("Voir tout")
                                        .font(.custom("Redaction-Regular", size: 14))
                                        .foregroundStyle(Color("DeepOrange"))
                                }
                            }
                            
                            ForEach(restaurant.menu.prefix(2)) { plat in
                                HStack(spacing: 12) {
                                    Image(plat.imagePlat)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(plat.nomPlat)
                                            .font(.custom("Redaction-Bold", size: 16))
                                            .foregroundStyle(Color("BrownText"))
                                            .lineLimit(1)
                                        
                                        Text(plat.descriptionPlat)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                            .lineLimit(1)
                                    }
                                    Spacer()
                                }
                                
                                if plat.id != restaurant.menu.prefix(2).last?.id {
                                    Divider()
                                }
                            }
                        }
                        .padding(20)
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
        
    }
    
    // MARK: - FONCTIONS MAPS (iOS 26 compatible)
    
    private func openAppleMaps(_ r: Restaurant) {
        let location = CLLocation(latitude: r.latitude, longitude: r.longitude)
        
        // Nouvelle méthode iOS 26 pour l'adresse
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
        RestaurantInfoDetails(restaurant: restaurants[8])
    }
}
