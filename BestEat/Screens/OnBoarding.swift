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
    @State private var selectedViande: Viande = .poisson
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
            ZStack {
                Color("Background").ignoresSafeArea()

                VStack {

                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {

                            interactiveSentenceView

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
                            Spacer()
                        }
                        .padding(.top, 20)
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

    private func emotionLine() -> Text {
        Text(
            """
            \(Text("Je me sens.. ")
                .font(.custom("Redaction-Regular", size: 24))
                .foregroundStyle(.brownText))\
            \(Text("\(selectedEmotion.rawValue.lowercased()) ⌄")
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.orange))\
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
                .foregroundStyle(.orange))\
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
                .foregroundStyle(.orange))\
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
                .font(.custom("Redaction-Bold", size: 40))
                .foregroundStyle(.orange))
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
                .foregroundStyle(.orange))
            """
        )
    }

}

#Preview {
    OnBoarding()
}
