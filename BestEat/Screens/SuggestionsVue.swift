import SwiftUI

struct SuggestionsVue: View {
    
    // --- CRITÈRES REÇUS ---
    let viande: Viande
    let regime: RegimeAlimentaire
    let budget: Budget
    
    // --- FILTRE LOGIQUE ---
    var restaurantsSuggeres: [Restaurant] {
        restaurants.filter { resto in
            
            let matchViande = resto.viandes.contains(viande)
            
            let matchBudget: Bool
            
            if resto.menu.isEmpty {
                matchBudget = false
            } else {
                let totalPrix = resto.menu.reduce(0.0) { $0 + $1.prix }
                let prixMoyen = totalPrix / Double(resto.menu.count)
                
                switch budget {
                case .petit:
                    matchBudget = prixMoyen <= 5
                    
                case .moyen:
                    matchBudget = prixMoyen <= 10
                    
                case .grand:
                    matchBudget = prixMoyen <= 20
                    
                case .gros:
                    matchBudget = true
                }
            }
            
            return matchViande && matchBudget
        }
    }
    
    // --- MISE EN PAGE ---
    let colonnes = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 25) {
                        
                        // --- EN-TÊTE ---
                        VStack(spacing: 8) {
                            Text("Nos suggestions")
                                .font(.custom("Redaction-Bold", size: 32))
                                .foregroundStyle(Color("BrownText"))
                            
                            Text("Basé sur \(viande.rawValue.lowercased()) & budget max \(budget.rawValue)")
                                .font(.custom("Redaction-Regular", size: 16))
                                .foregroundStyle(Color("DeepOrange"))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .padding(.top, 10)
                        
                        // --- RÉSULTATS ---
                        if restaurantsSuggeres.isEmpty {
                            ContentUnavailableView(
                                "Aucun résultat",
                                systemImage: "fork.knife.circle",
                                description: Text("Aucun restaurant trouvé pour ce budget (\(budget.rawValue)) avec cette viande.")
                            )
                            .foregroundStyle(Color("BrownText"))
                            .padding(.top, 50)
                            
                        } else {
                            LazyVGrid(columns: colonnes, spacing: 20) {
                                ForEach(restaurantsSuggeres) { resto in
                                    NavigationLink {
                                        RestaurantInfoDetails(restaurant: resto)
                                    } label: {
                                        SuggestionCard(restaurant: resto)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 40)
                        }
                    }
                }
            }
            .onAppear() {
                setupCustomNavBar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
        }
    }
    
    // texte de la navbar
    func setupCustomNavBar() {
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.shadowColor = .clear
        standard.backgroundColor = UIColor(named: "BackgroundCream")?.withAlphaComponent(0.5)

        standard.largeTitleTextAttributes = [
            .font: UIFont(name: "Redaction-Bold", size: 32) ?? UIFont.systemFont(ofSize: 34),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.brown
        ]
        standard.titleTextAttributes = [
            .font: UIFont(name: "Redaction-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor(named: "BrownText") ?? UIColor.brown
        ]

        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.configureWithTransparentBackground()
        scrollEdge.largeTitleTextAttributes = standard.largeTitleTextAttributes
        scrollEdge.titleTextAttributes = standard.titleTextAttributes
        
        UINavigationBar.appearance().standardAppearance = standard
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdge
    }
}

#Preview {
    SuggestionsVue(viande: .boeuf, regime: .halal, budget: .grand)
}
