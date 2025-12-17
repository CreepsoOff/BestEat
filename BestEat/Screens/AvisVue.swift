//
//  AvisVue.swift
//  BestEat
//
//  Created by apprenant98 on 17/12/2025.
//

import SwiftUI

struct AvisVue: View {
    let restaurant: Restaurant

    var body: some View {
        VStack {
            Text("Avis")
            Text("À implémenter")
        }
        .navigationTitle("Avis")
    }
}


#Preview {
    AvisVue(restaurant: restaurants[2])
}
