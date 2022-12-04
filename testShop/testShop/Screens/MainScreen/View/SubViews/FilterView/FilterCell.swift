//
//  FilterCell.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct FilterCell: View {
    @State var title: String
    @State var brand: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.custom(Resources.Fonts.medium.rawValue, size: 18))
                .foregroundColor(Resources.Colors.baseTextColor)
            
            HStack() {
                Text(brand)
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 18))
                    .foregroundColor(Resources.Colors.baseTextColor)
                
                Spacer()
                
                Image("arrowDown")
                    .resizable()
                    .frame(width: 16, height: 8)
            }
            .padding(.vertical, 7)
            .padding(.leading, 14)
            .padding(.trailing, 20)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "DCDCDC"), lineWidth: 1))
        }
        .padding(.leading, 46)
        .padding(.trailing, 31)
    }
}

struct FilterCell_Previews: PreviewProvider {
    static var previews: some View {
        FilterCell(title: "Brand", brand: "Samsung")
    }
}
