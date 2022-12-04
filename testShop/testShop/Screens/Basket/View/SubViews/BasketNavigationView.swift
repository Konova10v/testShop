//
//  BasketNavigationView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct BasketNavigationView: View {
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
            
            HStack(spacing: 9) {
                Text("Add address")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 15))
                    .foregroundColor(Resources.Colors.baseTextColor)
                
                Button {

                } label: {
                    Image("location")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                }
                .frame(width: 37, height: 37)
                .background(Resources.Colors.orange)
                .cornerRadius(10)
            }
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
    }
}

struct BasketNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BasketNavigationView()
    }
}
