//
//  RestoExtractVue.swift
//  BestEat
//
//  Created by apprenant98 on 11/12/2025.
//

import SwiftUI

struct RestoExtractVue: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
//            for tagElement in restaurant.tag {
                HStack {
                    TagCapsule(tag: restaurants[2].tag[0])
                }
//            }
        }
    }
}

#Preview {
    RestoExtractVue(restaurant: restaurants[2])
}
