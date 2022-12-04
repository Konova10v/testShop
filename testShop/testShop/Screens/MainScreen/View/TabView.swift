//
//  TabView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            HStack(spacing: 7) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                
                Text("Explorer")
                    .font(.custom(Resources.Fonts.bold.rawValue, size: 15))
                    .foregroundColor(.white)
            }
            Spacer()
            
            Image("basket")
                .resizable()
                .frame(width: 18, height: 18)
            
            Spacer()
            
            Image("favoriteNoActive")
                .resizable()
                .renderingMode(.template)
                .frame(width: 18, height: 18)
                .foregroundColor(.white)
            
            Spacer()
            
            Image("profile")
                .resizable()
                .frame(width: 18, height: 18)
            
            Spacer()
        }
        .frame(width: Screen.width - 10, height: 72)
        .background(Resources.Colors.baseTextColor)
        .cornerRadius(30)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
