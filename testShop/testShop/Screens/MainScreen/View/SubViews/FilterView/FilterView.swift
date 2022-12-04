//
//  FilterView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Button {
                    viewModel.isShowingBottomSheet.toggle()
                } label: {
                    Image("close")
                }
                .frame(width: 37, height: 37)
                .background(Resources.Colors.baseTextColor)
                .cornerRadius(10)
                
                Spacer()
                
                Text("Filter options")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 18))
                    .foregroundColor(Resources.Colors.baseTextColor)
                    .padding(.leading, 15)
                
                Spacer()
                
                
                Button {
                    viewModel.isShowingBottomSheet.toggle()
                } label: {
                    Text("Done")
                        .font(.custom(Resources.Fonts.medium.rawValue, size: 18))
                        .foregroundColor(.white)
                    
                }
                .frame(width: 86, height: 37)
                .background(Resources.Colors.orange)
                .cornerRadius(10)
            }
            .padding(.leading, 44)
            .padding(.trailing, 20)
            
            VStack(spacing: 10) {
                FilterCell(title: "Brand", brand: "Samsung")
                FilterCell(title: "Price", brand: "$300 - $500")
                FilterCell(title: "Size", brand: "4.5 to 5.5 inches")
            }
            .padding(.top)
        }
        .padding(.top, 24)
    }
}
