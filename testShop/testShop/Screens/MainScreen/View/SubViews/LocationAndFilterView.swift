//
//  LocationAndFilterView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct LocationAndFilterView: View {
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
                
            } label: {
                Image("filter")
            }

        }
        .padding(.horizontal, 33)
    }
}

struct LocationAndFilterView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndFilterView()
    }
}
