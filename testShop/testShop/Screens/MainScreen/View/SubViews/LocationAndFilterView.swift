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
            
            HStack(spacing: 11) {
                Image("location")
                
                Text("Zihuatanejo, Gro")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 15))
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image("filter")
            }

        }
        .padding(.horizontal, 32)
    }
}

struct LocationAndFilterView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAndFilterView()
    }
}
