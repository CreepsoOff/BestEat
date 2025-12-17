import SwiftUI

struct PlatsDetailsROw: View {
    @Bindable var plat : Plat
    var body: some View {
        VStack(spacing: 10) {

            Image(plat.imagePlat)
                .resizable()
                .frame(width: 120, height: 80)

            VStack(spacing: 8) {

                Text(plat.nomPlat)
                    .font(.headline)

                // ÉTOILE + BOUTON
                HStack(spacing: 12) {

                    // Bouton Favori
                    Button {
                        plat.isFavori.toggle()
                    } label: {
                        Image(systemName: plat.isFavori ? "star.fill" : "star")
                            .font(.title3)
                            .foregroundColor(.orange)
                    }

                    // Autre bouton
                    Button {
                        print("Bouton voir tapé pour : \(plat.nomPlat)")
                    } label: {
                        Text("Voir")
                            .font(.subheadline)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .background(Color.orange.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color.background)
        .cornerRadius(15)
        .shadow(
            color: .black.opacity(0.05),
            radius: 4,
            x: 0,
            y: 2
        )
    }
}

#Preview {
    PlatsDetailsROw(plat: plats[0])
}
