//
//  ButtonCapsule.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct ButtonCapsule: View {
    let tag: Tag
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: tag.icon)
                .font(.system(size: 10, weight: .bold))
            
            Text(tag.rawValue)
                .font(.system(size: 12, weight: .semibold))
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .foregroundColor(.white)
        .background(tag.color)
        .clipShape(Capsule())
        .glassEffect(.regular.interactive())
    }
}

#Preview {
    ButtonCapsule(tag: restaurants[2].tag[0])
}
