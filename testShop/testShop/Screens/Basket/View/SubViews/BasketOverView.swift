//
//  BasketOverView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct BasketOverView: View {
    @State var model: BasketViewModel.Value
    
    var body: some View {
        VStack() {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 45) {
                    ForEach(model.basket, id: \.id) { item in
                        BasketCell(image: item.images, name: item.title, price: String(item.price))
                    }
                }
            }
            
            Spacer()
            
            Color.white
                .opacity(0.25)
                .frame(height: 2)
                .padding(.horizontal, 4)
            
            HStack() {
                VStack(alignment:.leading, spacing: 12) {
                    Text("Total")
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 15))
                        .foregroundColor(.white)
                    
                    Text("Delivery")
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 15))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(alignment:.leading, spacing: 12) {
                    Text("$\(model.total) us")
                        .font(.custom(Resources.Fonts.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                    
                    Text(model.delivery)
                        .font(.custom(Resources.Fonts.bold.rawValue, size: 15))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 35)
            .padding(.top, Screen.width / 45)
            .padding(.bottom, Screen.width / 45)
            
            Color.white
                .opacity(0.25)
                .frame(height: 2)
                .padding(.horizontal, 4)
            
            Button {
            } label: {
                Text("Checkout")
                    .font(.custom(Resources.Fonts.bold.rawValue, size: 20))
                    .foregroundColor(.white)
            }
            .frame(width: Screen.width - 60, height: 54)
            .background(Resources.Colors.orange)
            .cornerRadius(10)
            .padding(.top, 27)
            .padding(.bottom, 30)
            
        }
        .frame(width: Screen.width)
        .padding(.top, Screen.width / 10)
        .background(RoundedCorners(topLeft: 30,
                                   topRight: 30,
                                   bottomLeft: 0,
                                   bottomRight: 0)
            .fill(Resources.Colors.baseTextColor))
    }
}
