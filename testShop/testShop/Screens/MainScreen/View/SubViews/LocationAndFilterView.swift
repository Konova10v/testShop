//
//  LocationAndFilterView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct LocationAndFilterView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        HStack() {
            Spacer()
            
            Button {
                
            } label: {
                HStack(spacing: 11) {
                    Image("location")
                    
                    HStack(spacing: 8) {
                        Text("Zihuatanejo, Gro")
                            .font(.custom(Resources.Fonts.medium.rawValue, size: 15))
                            .foregroundColor(Resources.Colors.baseTextColor)
                        
                        Image("arrowDown")
                    }
                }
            }
            
            Spacer()
            
            Button {
                viewModel.isShowingBottomSheet.toggle()
            } label: {
                Image("filter")
            }

        }
        .padding(.horizontal, 33)
    }
}
