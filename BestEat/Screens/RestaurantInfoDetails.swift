//
//  informationTag.swift
//  BestHEAT
//
//  Created by apprenant96 on 11/12/2025.
//

import SwiftUI

struct RestaurantInfoDetails: View {
    var body: some View {
        VStack(spacing: 20) {
            
            
            Text("Hello, World!")
                .font(.title)
                .bold()
                .padding(.top, 100)
            
            
        
            VStack {
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 180)
                    .padding(.horizontal, 20)
                    .cornerRadius(60)
                
                Text("Num: 03 20 34 35 22")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Tél: 07 67 25 25 89")
                    .font(.headline)
                    .padding(.top, 5)
                    .padding(.bottom, )
            }
            .frame(width: 316)
            .padding()
            .background(.orange)
            .foregroundStyle(.white)
            .cornerRadius(16)

            VStack {
                Text("Bar au 53 de la Monnaie , 59800 Lille")
                    .font(.headline)
                    .padding(.top,2)
                
                Text("Lille")
                    .font(.headline)
                    .padding(.top, 2)
                
                Text("Métro - Ligne 1 : Rihour")
                    .font(.headline)
                    .padding(.top, 2)
                
                Text("Métro - ligne 1 et 2 : Lille Flandre")
                    .font(.headline)
                    .padding(.top, 2)
                
            }
            .padding()
            .background(.orange)
            .cornerRadius(16)
            .foregroundStyle(.white)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    RestaurantInfoDetails()
}
