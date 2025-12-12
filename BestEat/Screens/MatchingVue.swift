//
//  Matching.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct MatchingVue: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundCream.ignoresSafeArea()
                Text("Matching")
            }
            .navigationBarTitle("")
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Matching")
                        .font(.custom("Redaction-Regular", size: 32))
                    
                }
                // AJOUT DU BOUTON PROFIL
                ToolbarItem(placement: .topBarTrailing) {
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

#Preview {
    MatchingVue()
}
