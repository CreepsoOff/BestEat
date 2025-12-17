//
//  TagCapsule.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct TagCapsule: View {
    let tag: Tag
    
    var body: some View {
        HStack(spacing: 4) {
            // L'icône
            Image(systemName: tag.icon)
                .font(.system(size: 10, weight: .bold))

            // Texte
            Text(tag.rawValue)
                .font(.system(size: 12, weight: .semibold))

        }
        .foregroundStyle(.brownText)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background(tag.color)
        .clipShape(Capsule())
        .glassEffect(.regular.interactive())
    }
}
#Preview {
    TagCapsule(tag: restaurants[2].tag[0])
}
