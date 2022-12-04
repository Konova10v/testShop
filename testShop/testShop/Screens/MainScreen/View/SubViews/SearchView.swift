//
//  SearchView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("search")
                    .padding(.leading, CGFloat(11.0))
                
                TextField("Search", text: $text, onEditingChanged: { active in
                })
                .padding(.vertical, CGFloat(8.0))
                .padding(.trailing, CGFloat(10.0))
                .font(.system(size: 16,
                              weight: .medium,
                              design: .default))
                .foregroundColor(Resources.Colors.baseTextColor)
            }
            .frame(width: Screen.width - 100)
            .cornerRadius(8)
            .background(RoundedCorners(topLeft: 8,
                                       topRight: 8,
                                       bottomLeft: 8,
                                       bottomRight: 8)
                .fill(Color.white))
            
            Spacer()
            
            Button {
                
            } label: {
                Image("qr")
                    .frame(width: 34, height: 34)
                    .background(Resources.Colors.orange)
                    .clipShape(Circle())
            }
        }
        .padding(.leading, 32)
        .padding(.trailing, 37)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
