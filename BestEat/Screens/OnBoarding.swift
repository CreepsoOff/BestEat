//
//  OnBoarding.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import MapKit
import SwiftUI

// MARK: - VUE PRINCIPALE
struct OnBoarding: View {
    
    // --- ÉTATS ---
    @State private var selectedEmotion: Emotion = .joie
    @State private var selectedViande: Viande = .boeuf
    @State private var selectedDeplacement: ModeDeplacement = .pieds
    @State private var selectedRegime: RegimeAlimentaire = .halal
    @State private var selectedBudget: Budget = .moyen

    // --- CARTE ---
    @Namespace private var mapNamespace
    @State private var showFullMap = false
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.6333, longitude: 3.0667), // Lille
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("BackgroundCream").ignoresSafeArea()
                
                // CONTENU SCROLLABLE
                if !showFullMap {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 30) {

                            // 1. Phrase
                            OnBoardingSentenceView(
                                selectedEmotion: $selectedEmotion,
                                selectedViande: $selectedViande,
                                selectedDeplacement: $selectedDeplacement,
                                selectedRegime: $selectedRegime,
                                selectedBudget: $selectedBudget
                            )
                            .padding(.top, 20)

                            // 2. Bouton Suggestions
                            OnBoardingSuggestionsButton(
                                viande: selectedViande,
                                regime: selectedRegime,
                                budget: selectedBudget
                            )
                            
                            // 3. Mini-Map
                            OnBoardingMiniMap(
                                position: $position,
                                mapNamespace: mapNamespace,
                                onTap: {
                                    withAnimation(.easeInOut(duration: 0.35)) { showFullMap = true }
                                }
                            )
                            .padding(.horizontal)
                        }
                    }
                }
                
                // VUE CARTE PLEIN ÉCRAN
                if showFullMap {
                    CarteVue(namespace: mapNamespace, showFullMap: $showFullMap)
                        .zIndex(1)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                OnBoardingToolbar(showFullMap: $showFullMap)
            }
        }
    }
}

// MARK: - SOUS-VUES (COMPOSANTS)

// 1. PHRASE INTERACTIVE
struct OnBoardingSentenceView: View {
    @Binding var selectedEmotion: Emotion
    @Binding var selectedViande: Viande
    @Binding var selectedDeplacement: ModeDeplacement
    @Binding var selectedRegime: RegimeAlimentaire
    @Binding var selectedBudget: Budget
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Émotion
            Menu {
                ForEach(Emotion.allCases, id: \.self) { emotion in
                    Button(emotion.rawValue) { selectedEmotion = emotion }
                }
            } label: {
                SentenceLine(prefix: "Je me sens.. ", value: selectedEmotion.rawValue, suffix: " et j'ai", color: .deepOrange)
            }

            // Viande
            Menu {
                ForEach(Viande.allCases, id: \.self) { v in
                    Button(v.rawValue) { selectedViande = v }
                }
            } label: {
                SentenceLine(prefix: "envie de.. ", value: selectedViande.rawValue, suffix: " je vais", color: .lightOrange)
            }

            // Déplacement
            Menu {
                ForEach(ModeDeplacement.allCases, id: \.self) { m in
                    Button(m.rawValue) { selectedDeplacement = m }
                }
            } label: {
                SentenceLine(prefix: "me déplacer.. ", value: selectedDeplacement.rawValue, suffix: " et il", color: .deepOrange)
            }

            // Régime
            Menu {
                ForEach(RegimeAlimentaire.allCases, id: \.self) { r in
                    Button(r.rawValue) { selectedRegime = r }
                }
            } label: {
                SentenceLine(prefix: "faut savoir que je mange.. ", value: selectedRegime.rawValue, suffix: "", color: .lightOrange)
            }

            // Budget
            Menu {
                ForEach(Budget.allCases, id: \.self) { b in
                    Button(b.rawValue) { selectedBudget = b }
                }
            } label: {
                SentenceLine(prefix: "enfin, il faut savoir que j'ai un budget de ", value: selectedBudget.rawValue, suffix: "", color: .deepOrange)
            }

        }
        .padding(.horizontal)
        .buttonStyle(.plain)
    }
}

struct SentenceLine: View {
    let prefix: String
    let value: String
    let suffix: String
    let color: Color
    
    var body: some View {
        Text(
            """
            \(Text(prefix)
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(Color("BrownText")))\
            \(Text("\(value.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(color))\
            \(Text(suffix.isEmpty ? "" : suffix)
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(Color("BrownText")))
            """
        )
    }
}

struct OnBoardingSuggestionsButton: View {
    let viande: Viande
    let regime: RegimeAlimentaire
    let budget: Budget
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink {
                SuggestionsVue(
                    viande: viande,
                    regime: regime,
                    budget: budget
                )
            } label: {
                HStack {
                    Text("Accéder à mes suggestions")
                        .font(.custom("Redaction-Bold", size: 18))
                    Image(systemName: "arrow.right")
                        .bold()
                }
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
                .background(Color("BrownText"))
                .clipShape(Capsule())
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
            }
            Spacer()
        }
    }
}

// 3. MINI MAP
struct OnBoardingMiniMap: View {
    @Binding var position: MapCameraPosition
    let mapNamespace: Namespace.ID
    let onTap: () -> Void
    
    var body: some View {
        Map(position: $position)
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .matchedGeometryEffect(id: "map", in: mapNamespace)
            .onTapGesture(perform: onTap)
    }
}

// 4. TOOLBAR
struct OnBoardingToolbar: ToolbarContent {
    @Binding var showFullMap: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(showFullMap ? "Carte" : "Mes envies")
                .font(.custom("Redaction-Regular", size: 32))
                .padding(.top, 10)
                .foregroundStyle(Color("BrownText"))
                .contentTransition(.numericText())
                .animation(.bouncy, value: showFullMap)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            if showFullMap {
                Button {
                    withAnimation(.easeInOut(duration: 0.35)) {
                        showFullMap = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .bold()
                        .foregroundStyle(Color("BrownText"))
                }
            } else {
                NavigationLink {
                    MonProfilVue()
                } label: {
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color("BrownText"))
                }
            }
        }
    }
}

#Preview {
    OnBoarding()
}
