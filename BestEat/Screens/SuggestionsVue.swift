//
//  Suggestions.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI

struct SuggestionsVue: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Texte")
            }
            .navigationBarTitle("")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Suggestions")
                        .font(.custom("Redaction-Regular", size: 32))
                        
                        
                    }
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
    SuggestionsVue()
}
