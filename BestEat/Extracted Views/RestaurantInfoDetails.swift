import SwiftUI
import MapKit

// MARK: - VUE PRINCIPALE
struct RestaurantInfoDetails: View {
    
    @State var restaurant: Restaurant
    @State private var showItinerairePicker = false
    
    var body: some View {
        ZStack {
            Color("BackgroundCream").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 25) {
                    
                    // 1. Image du haut
                    RestoBannerView(imageName: restaurant.image)
                    
                    // 2. Titre
                    RestoTitleView(nom: restaurant.nom)
                    
                    // 3. Boutons d'action (Binding nécessaire pour modifier)
                    RestoActionsView(restaurant: $restaurant)
                    
                    // 4. Description
                    RestoDescriptionView(description: restaurant.desc)
                    
                    // 5. Contact & Horaires
                    RestoContactView(restaurant: restaurant)
                    
                    // 6. Adresse & GPS
                    RestoAddressView(restaurant: restaurant, showItinerairePicker: $showItinerairePicker)
                    
                    // 7. Menu Aperçu
                    RestoMenuPreview(restaurant: restaurant)
                    
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
            Button("Apple Plans") { MapUtils.openAppleMaps(restaurant) }
            Button("Google Maps") { MapUtils.openGoogleMaps(restaurant) }
            Button("Annuler", role: .cancel) {}
        }
    }
}

// MARK: - SOUS-VUES (COMPOSANTS)

// 1. BANNIÈRE IMAGE
struct RestoBannerView: View {
    let imageName: String
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 370, maxHeight: 250)
                .clipped()
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

// 2. TITRE
struct RestoTitleView: View {
    let nom: String
    var body: some View {
        Text(nom)
            .font(.custom("Redaction-Bold", size: 32))
            .foregroundStyle(Color("BrownText"))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

// 3. ACTIONS (LIKE & VISITE)
struct RestoActionsView: View {
    @Binding var restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 15) {
            // BOUTON LIKE
            ActionButton(
                isActive: restaurant.isLiked,
                activeIcon: "heart.fill",
                inactiveIcon: "heart",
                activeColor: Color("DeepOrange"),
                inactiveColor: .gray,
                activeText: "Match !",
                inactiveText: "J'aime"
            ) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    restaurant.isLiked.toggle()
                }
            }
            
            // BOUTON VISITE
            ActionButton(
                isActive: restaurant.estVisite,
                activeIcon: "checkmark.seal.fill",
                inactiveIcon: "clock.fill",
                activeColor: .green,
                inactiveColor: .orange,
                activeText: "Visité",
                inactiveText: "À faire"
            ) {
                withAnimation { restaurant.estVisite.toggle() }
            }
        }
        .padding(.horizontal)
    }
}

struct ActionButton: View {
    let isActive: Bool
    let activeIcon: String
    let inactiveIcon: String
    let activeColor: Color
    let inactiveColor: Color
    let activeText: String
    let inactiveText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isActive ? activeIcon : inactiveIcon)
                    .font(.title2)
                    .foregroundStyle(isActive ? activeColor : inactiveColor)
                    .symbolEffect(.bounce, value: isActive)
                
                Text(isActive ? activeText : inactiveText)
                    .font(.custom("Redaction-Bold", size: 18))
                    .foregroundStyle(Color("BrownText"))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isActive ? activeColor.opacity(0.5) : Color.clear, lineWidth: 2)
            )
        }
    }
}

// 4. DESCRIPTION
struct RestoDescriptionView: View {
    let description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("À propos")
                .font(.custom("Redaction-Bold", size: 20))
                .foregroundStyle(Color("BrownText"))
            
            Text(description)
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
    }
}

// 5. CONTACT & AVIS
struct RestoContactView: View {
    let restaurant: Restaurant
    
    private var jourActuel: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "fr_FR")
        f.dateFormat = "EEEE"
        return f.string(from: Date()).capitalized
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            NavigationLink {
                AvisVue(restaurant: restaurant)
            } label: {
                HStack {
                    Image(systemName: "star.bubble.fill")
                        .foregroundStyle(Color("DeepOrange"))
                        .frame(width: 24)
                    
                    Text("Lire les avis (\(Int.random(in: 5...20)))")
                        .font(.custom("Redaction-Bold", size: 18))
                        .foregroundStyle(Color("BrownText"))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            
            Divider()
            
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
                    .padding(.horizontal, 4)
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
    }
}

// 6. ADRESSE
struct RestoAddressView: View {
    let restaurant: Restaurant
    @Binding var showItinerairePicker: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Accès transports")
                    .font(.custom("Redaction-Bold", size: 16))
                    .foregroundStyle(Color("BrownText"))
                
                TransportRow(icon: "tram.fill", text: "Métro Ligne 1 : Rihour")
                TransportRow(icon: "tram", text: "Métro Ligne 1 & 2 : Lille Flandres")
            }
            
            Divider()
            
            Button { showItinerairePicker = true } label: {
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
    }
}

struct TransportRow: View {
    let icon: String
    let text: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 20)
                .foregroundStyle(Color("DeepOrange"))
            Text(text)
        }
        .font(.custom("Redaction-Regular", size: 14))
        .foregroundStyle(.gray)
    }
}

// 7. MENU PREVIEW
struct RestoMenuPreview: View {
    let restaurant: Restaurant
    
    var body: some View {
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
                    
                    // COEUR DYNAMIQUE
                    if plat.isFavori {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(Color("DeepOrange"))
                            .font(.system(size: 14))
                    }
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
    }
}

// MARK: - UTILITAIRES MAPS
struct MapUtils {
    static func openAppleMaps(_ r: Restaurant) {
        let location = CLLocation(latitude: r.latitude, longitude: r.longitude)
        let address = MKAddress(fullAddress: r.adresse, shortAddress: nil)
        let mapItem = MKMapItem(location: location, address: address)
        mapItem.name = r.nom
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
    
    static func openGoogleMaps(_ r: Restaurant) {
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
        // Simulation pour la preview
        RestaurantInfoDetails(restaurant: restaurants[0])
    }
}
