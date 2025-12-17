//
//  OnBoarding.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import MapKit
import SwiftUI

struct OnBoarding: View {
    // --- ÉTATS DE SÉLECTION ---
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
            center: CLLocationCoordinate2D(
                latitude: 50.6333,
                longitude: 3.0667
            ),  // Lille
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("BackgroundCream").ignoresSafeArea()
                
                // Si la carte n'est pas en plein écran, on affiche le contenu
                if !showFullMap {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 30) {

                            interactiveSentenceView
                                .padding(.top, 20)

                            
                            // --- SUGGESTIONS ---
                            HStack {
                                Spacer()
                                NavigationLink {
                                    SuggestionsVue(
                                        viande: selectedViande,
                                        regime: selectedRegime
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
                                    .background(Color("BrownText")) // Couleur principale
                                    .clipShape(Capsule())
                                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                                }
                                Spacer()
                            }
                            
                            // --- CARTE MINIATURE ---
                            Map(position: $position)
                                .frame(height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .matchedGeometryEffect(id: "map", in: mapNamespace)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.35)) {
                                        showFullMap = true
                                    }
                                }
                                .padding(.horizontal)
                            
                        }
                    }
                }
                
                if showFullMap {
                    CarteVue(
                        namespace: mapNamespace,
                        showFullMap: $showFullMap
                    )
                    .zIndex(1)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(showFullMap ? "Carte" : "Mes envies")
                        .font(.custom("Redaction-Regular", size: 24))
                        .padding(.top, 10)
                        .foregroundStyle(.brownText)
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
                                .foregroundStyle(.brownText)
                        }
                    } else {
                        NavigationLink {
                            MonProfilVue()
                        } label: {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.brownText)
                        }
                    }
                }
            }
        }
    }

    private var interactiveSentenceView: some View {
        VStack(alignment: .leading, spacing: 12) {

            Menu {
                ForEach(Emotion.allCases, id: \.self) { emotion in
                    Button(emotion.rawValue) {
                        selectedEmotion = emotion
                    }
                }
            } label: {
                emotionLine()
            }
            .buttonStyle(.plain)

            Menu {
                ForEach(Viande.allCases, id: \.self) { v in
                    Button(v.rawValue) {
                        selectedViande = v
                    }
                }
            } label: {
                viandeLine()
            }
            .buttonStyle(.plain)

            Menu {
                ForEach(ModeDeplacement.allCases, id: \.self) { m in
                    Button(m.rawValue) {
                        selectedDeplacement = m
                    }
                }
            } label: {
                deplacementLine()
            }
            .buttonStyle(.plain)

            Menu {
                ForEach(RegimeAlimentaire.allCases, id: \.self) { r in
                    Button(r.rawValue) {
                        selectedRegime = r
                    }
                }
            } label: {
                regimeLine()
            }
            .buttonStyle(.plain)

            Menu {
                ForEach(Budget.allCases, id: \.self) { b in
                    Button(b.rawValue) {
                        selectedBudget = b
                    }
                }
            } label: {
                budgetLine()
            }
            .buttonStyle(.plain)

        }
        .padding(.horizontal)
    }

    // --- FONCTIONS TEXTE ---

    private func emotionLine() -> Text {
        Text(
            """
            \(Text("Je me sens.. ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedEmotion.rawValue.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.deepOrange))\
            \(Text(" et j'ai")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))
            """
        )
    }

    private func viandeLine() -> Text {
        Text(
            """
            \(Text("envie de.. ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedViande.rawValue.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.lightOrange))\
            \(Text(" je vais")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))
            """
        )
    }

    private func deplacementLine() -> Text {
        Text(
            """
            \(Text("me déplacer.. ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedDeplacement.rawValue.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.deepOrange))\
            \(Text(" et il")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))
            """
        )
    }

    private func regimeLine() -> Text {
        Text(
            """
            \(Text("faut savoir que je mange.. ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedRegime.rawValue.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 38))
                .foregroundStyle(.lightOrange))
            """
        )
    }

    private func budgetLine() -> Text {
        Text(
            """
            \(Text("enfin, il faut savoir que j'ai un budget de ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedBudget.rawValue) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.deepOrange))
            """
        )
    }
}

#Preview {
    OnBoarding()
}
