//
//  BasketCell.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct BasketCell: View {
    @State var image: String
    @State var name: String
    @State var price: String
    
    var body: some View {
        HStack(spacing: 17) {
            WebImage(url: URL(string: image))
                .resizable()
                .frame(width: 88, height: 88)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 20))
                    .foregroundColor(.white)
                
                Text("$\(price)")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 20))
                    .foregroundColor(Resources.Colors.orange)
            }
            .padding(.vertical, 5)
            
            VStack() {
                Button {
                    
                } label: {
                    Image("minus")
                    
                }
                .padding(.top, 10)
                
                Text("2")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 20))
                    .foregroundColor(.white)
                
                Button {
                    
                } label: {
                    Image("plus")
                    
                }
                .padding(.bottom, 10)
            }
            .padding(.horizontal, 5)
            .background(Color.init(hex: "282843"))
            .cornerRadius(26)
            
            Button {
                
            } label: {
                Image("delete")
                
            }
        }
        .frame(width: Screen.width - 60, height: 88)
    }
}
