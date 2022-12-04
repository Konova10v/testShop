//
//  ProductNavigationView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import SwiftUI

struct ProductNavigationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack() {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image("back")
            }
            .frame(width: 37, height: 37)
            .background(Resources.Colors.baseTextColor)
            .cornerRadius(10)
            
            Spacer()
            
            Text("Product Details")
                .font(.custom(Resources.Fonts.medium.rawValue, size: 18))
                .foregroundColor(Resources.Colors.baseTextColor)
            
            Spacer()
            
            Button {
                
            } label: {
                Image("basket")
            }
            .frame(width: 37, height: 37)
            .background(Resources.Colors.orange)
            .cornerRadius(10)
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
    }
}

struct ProductNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNavigationView()
    }
}
