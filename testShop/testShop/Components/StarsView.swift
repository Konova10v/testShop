//
//  StarsView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct StarsView: View {
    var rating: CGFloat
    var maxRating: Int

    var body: some View {
        let stars = HStack(spacing: 9) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}



