//
//  EtoileExtracted.swift
//  BestEat
//
//  Created by apprenant98 on 12/12/2025.
//

import SwiftUI

struct EtoileExtracted: View {
    let index: Int
    let rating: Double
    
    var body: some View {
        Image(systemName: starType())
            .foregroundColor(.yellow)
            .font(.title3)
    }
    
    func starType() -> String {
        let starValue = Double(index)
        
        if starValue <= rating {
            return "star.fill"
        } else if starValue - rating <= 0.5 && starValue > rating {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }
}

#Preview {
    EtoileExtracted(index: 2, rating: 2.0)
}
