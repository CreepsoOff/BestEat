//
//  MonProfilVue.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

// MARK: - VUE PRINCIPALE
struct MonProfilVue: View {
    
    // --- PERSISTENCE (APP STORAGE) ---
    // Ces clés permettent de sauvegarder les données et de les partager avec l'OnBoarding
    @AppStorage("userProfileName") private var storedName: String = "Gourmet"
    @AppStorage("userBudget") private var storedBudget: String = Budget.moyen.rawValue
    @AppStorage("userEmotion") private var storedEmotion: String = Emotion.joie.rawValue
    @AppStorage("userRegime") private var storedRegime: String = "" // Stocké sous forme de String séparé par des virgules
    
    // État local synchronisé
    @State private var profil = Profil(
        nom: "Achraf",
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
                        
                        // 1. EN-TÊTE
                        ProfilHeaderView(
                            nom: profil.nom,
                            onEdit: {
                                nomProfil = profil.nom
                                showAlert = true
                            }
                        )
                        .alert("Entrez votre nom", isPresented: $showAlert) {
                            TextField("Votre nom", text: $nomProfil)
                            
                            // Annuler ferme uniquement la pop-up
                            Button("Annuler", role: .cancel) { }
                            
                            // Valider désactivé si vide
                            Button("Valider") {
                                saveName()
                            }
                            .disabled(nomProfil.isEmpty)
                        }
                        
                        // 2. BUDGET
                        ProfilBudgetSection(selectedBudget: $profil.budget)
                        
                        // 3. RÉGIME
                        ProfilRegimeSection(selectedRegimes: $profil.regime)
                        
                        // 4. ÉMOTION
                        ProfilEmotionSection(selectedEmotions: $profil.emotion)
                        
                        // 5. BOUTON VISITES
                        ProfilVisitsButton()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            
            // --- CHARGEMENT & SAUVEGARDE AUTO ---
            .onAppear(perform: loadData)
            .onChange(of: profil.budget) { _, newValue in storedBudget = newValue.rawValue }
            .onChange(of: profil.regime) { _, newValue in saveRegimeToStorage(newValue) }
            .onChange(of: profil.emotion) { _, newValue in
                if let first = newValue.first { storedEmotion = first.rawValue }
            }
        }
    }
    
    // MARK: - LOGIQUE PERSISTENCE
    
    private func loadData() {
        // Chargement Nom
        profil.nom = storedName
        
        // Chargement Budget
        if let b = Budget(rawValue: storedBudget) {
            profil.budget = b
        }
        
        // Chargement Émotion
        if let e = Emotion(rawValue: storedEmotion) {
            profil.emotion = [e]
        }
        
        // Chargement Régime (Décodage CSV)
        if !storedRegime.isEmpty {
            let rawValues = storedRegime.split(separator: ",").map(String.init)
            profil.regime = rawValues.compactMap { RegimeAlimentaire(rawValue: $0) }
        } else {
            profil.regime = [.halal, .vegetarien] // Défaut
        }
    }
    
    private func saveName() {
        if !nomProfil.isEmpty {
            profil.nom = nomProfil
            storedName = nomProfil
        }
    }
    
    private func saveRegimeToStorage(_ regimes: [RegimeAlimentaire]) {
        storedRegime = regimes.map { $0.rawValue }.joined(separator: ",")
    }
}

// MARK: - SOUS-VUES (EXTRACTED VIEWS)

// 1. HEADER
struct ProfilHeaderView: View {
    let nom: String
    let onEdit: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color("BrownText"))
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 5)
            
            HStack {
                Text("Bonjour \(nom)")
                    .font(.custom("Redaction-Bold", size: 34))
                    .foregroundStyle(Color("BrownText"))
                
                Button(action: onEdit) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                }
            }
        }
        .padding(.top, 20)
    }
}

// 2. BUDGET
struct ProfilBudgetSection: View {
    @Binding var selectedBudget: Budget
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            SectionTitle(text: "Budget")
            
            HStack(spacing: 8) {
                ForEach(Budget.allCases, id: \.self) { budget in
                    BudgetCard(
                        budget: budget,
                        isSelected: selectedBudget == budget,
                        action: { withAnimation { selectedBudget = budget } }
                    )
                }
            }
        }
        .padding(.horizontal)
    }
}

// 3. RÉGIME
struct ProfilRegimeSection: View {
    @Binding var selectedRegimes: [RegimeAlimentaire]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            SectionTitle(text: "Régime")
            
            VStack(spacing: 12) {
                ForEach(RegimeAlimentaire.allCases, id: \.self) { regime in
                    ToggleRow(
                        title: regime.rawValue.capitalized,
                        isSelected: selectedRegimes.contains(regime)
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
    }
    
    private func toggleRegime(_ r: RegimeAlimentaire) {
        if let index = selectedRegimes.firstIndex(of: r) {
            selectedRegimes.remove(at: index)
        } else {
            selectedRegimes.append(r)
        }
    }
}

// 4. ÉMOTION
struct ProfilEmotionSection: View {
    @Binding var selectedEmotions: [Emotion]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            SectionTitle(text: "Humeur actuelle")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                ForEach(Emotion.allCases) { emotion in
                    EmotionButton(
                        emotion: emotion,
                        isSelected: selectedEmotions.contains(emotion)
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
    }
    
    private func toggleEmotion(_ e: Emotion) {
        // Une seule émotion possible : on remplace tout le tableau
        selectedEmotions = [e]
    }
}

// 5. BOUTON VISITES
struct ProfilVisitsButton: View {
    var body: some View {
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

// Helper Titre
struct SectionTitle: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.custom("Redaction-Regular", size: 24))
            .foregroundStyle(Color("BrownText"))
    }
}

// MARK: - COMPOSANTS UI EXISTANTS

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
