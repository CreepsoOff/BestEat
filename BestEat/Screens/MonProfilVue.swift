//
//  MonProfilVue.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct MonProfilVue: View {
    
    @State private var profil = Profil(
        nom: "Gourmet",
        budget: .moyen,
        regime: [.halal, .vegetarien],
        emotion: [.joie]
    )
    @State private var showAlert: Bool = false
    @State private var nomProfil: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundCream").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        
                        // --- EN-TÊTE ---
                        VStack(spacing: 10) {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(Color("BrownText"))
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.1), radius: 5)
                            
                            HStack {
                                Text("Bonjour \(profil.nom)")
                                    .font(.custom("Redaction-Bold", size: 34))
                                    .foregroundStyle(Color("BrownText"))
                                
                                Button {
                                    nomProfil = profil.nom
                                    showAlert.toggle()
                                } label: {
                                    Image(systemName: "pencil.circle.fill")
                                        .font(.system(size: 24))
                                }
                                .alert("Entrez votre nom", isPresented: $showAlert) {
                                    TextField("Votre nom", text: $nomProfil)
                                    
                                    Button("Annuler", role: .cancel) { }
                                    
                                    Button("Valider", action: editProfileName)
                                        .disabled(nomProfil.isEmpty)
                                }
                                .foregroundStyle(.accent)
                                
                            }
                        }
                        .padding(.top, 20)
                        
                        // --- SECTION BUDGET ---
                        VStack(alignment: .leading, spacing: 15) {
                            sectionTitle("Budget")
                            
                            HStack(spacing: 8) {
                                ForEach(Budget.allCases, id: \.self) { budget in
                                    BudgetCard(
                                        budget: budget,
                                        isSelected: profil.budget == budget,
                                        action: { withAnimation { profil.budget = budget } }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // --- SECTION RÉGIME ---
                        VStack(alignment: .leading, spacing: 15) {
                            sectionTitle("Régime")
                            
                            VStack(spacing: 12) {
                                ForEach(RegimeAlimentaire.allCases, id: \.self) { regime in
                                    ToggleRow(
                                        title: regime.rawValue.capitalized,
                                        isSelected: profil.regime.contains(regime)
                                    ) {
                                        toggleRegime(regime)
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                            )
                        }
                        .padding(.horizontal)
                        
                        // --- SECTION ÉMOTION ---
                        VStack(alignment: .leading, spacing: 15) {
                            sectionTitle("Humeur actuelle")
                            
                            // Grille adaptative pour les émojis
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                                ForEach(Emotion.allCases) { emotion in
                                    EmotionButton(
                                        emotion: emotion,
                                        isSelected: profil.emotion.contains(emotion)
                                    ) {
                                        toggleEmotion(emotion)
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                            )
                        }
                        .padding(.horizontal)
                        
                        // --- LIEN VERS VISITES ---
                        NavigationLink {
                            RestaurantsVisitesVue()
                        } label: {
                            HStack {
                                Image(systemName: "book.fill")
                                Text("Voir mes visites")
                                    .font(.custom("Redaction-Regular", size: 18))
                            }
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 30)
                            .background(Color("BrownText"))
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                        }
                        .padding(.vertical, 30)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        }
    }
    
    // MARK: - LOGIQUE
    
    private func editProfileName() {
        // On ne sauvegarde que si ce n'est pas vide (double sécurité)
        if !nomProfil.isEmpty {
            profil.nom = nomProfil
        }
    }
    
    private func toggleRegime(_ r: RegimeAlimentaire) {
        if let index = profil.regime.firstIndex(of: r) {
            profil.regime.remove(at: index)
        } else {
            profil.regime.append(r)
        }
    }
    
    private func toggleEmotion(_ e: Emotion) {
        if let index = profil.emotion.firstIndex(of: e) {
            profil.emotion.remove(at: index)
        } else {
            profil.emotion.append(e)
        }
    }
    
    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.custom("Redaction-Regular", size: 24))
            .foregroundStyle(Color("BrownText"))
    }
}

// MARK: - SOUS-VUES

struct BudgetCard: View {
    let budget: Budget
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(budget.rawValue)
                    .font(.system(size: 12, weight: .bold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .foregroundStyle(isSelected ? .white : Color("BrownText"))
                
                Text(symbolString)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(isSelected ? .white : Color("DeepOrange"))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(isSelected ? Color("DeepOrange") : Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
            )
        }
    }
    
    var symbolString: String {
        switch budget {
        case .petit: return "€"
        case .moyen: return "€€"
        case .grand: return "€€€"
        case .gros:  return "€€€€"
        }
    }
}

struct ToggleRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.body)
                    .foregroundStyle(Color("BrownText"))
                Spacer()
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(isSelected ? Color("LightOrange") : Color.gray.opacity(0.3))
                    .contentTransition(.symbolEffect(.replace))
            }
            .contentShape(Rectangle())
        }
        .padding(.vertical, 4)
    }
}

struct EmotionButton: View {
    let emotion: Emotion
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Text(emotion.emoji)
                    .font(.system(size: 40))
                    .scaleEffect(isSelected ? 1.2 : 1.0)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(isSelected ? Color("LightOrange").opacity(0.2) : Color.clear)
                    )
                    .overlay(
                        Circle()
                            .stroke(isSelected ? Color("LightOrange") : Color.clear, lineWidth: 2)
                    )
                
                Text(emotion.rawValue)
                    .font(.caption2)
                    .foregroundStyle(Color("BrownText").opacity(0.7))
                    .lineLimit(1)
            }
        }
        .animation(.spring(response: 0.3), value: isSelected)
    }
}

#Preview {
    MonProfilVue()
}
