//
//  CarteVue.swift
//  BestEat
//
//  Created by apprenant98 on 10/12/2025.
//

import SwiftUI
import MapKit

struct CarteVue: View {
    var body: some View {
        NavigationStack {
            Map {
                
            }
            .navigationBarTitle("")
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Carte")
                        .font(.custom("Redaction-Regular", size: 32))
                }
            }
        }
        
    }
}

#Preview {
    CarteVue()
}
