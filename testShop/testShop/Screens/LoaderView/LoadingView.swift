//
//  LoadingView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI
import SkeletonUI

struct LoaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: LoaderViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 16) {
                Rectangle()
                    .frame(height: 172)
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .cornerRadius(radius: 24, corners: [.bottomLeft, .bottomRight])
                
                Rectangle()
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .frame(height: 346)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 16)
                
                Rectangle()
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .frame(height: 72)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 16)
                
                Rectangle()
                    .skeleton(with: true)
                    .shape(type: .rectangle)
                    .frame(height: 72)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 16)
            }
            
            if viewModel.showBack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("back_action")
                        .renderingMode(.template)
                        .foregroundColor(Color(viewModel.color))
                })
                .frame(width: 40, height: 40)
                .background(BlurView(style: .light)
                                .cornerRadius(8))
                .padding(.top, 52)
                .padding(.leading, 16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        let loaderViewModel = LoaderViewModel(showBack: true)
        
        LoaderView(viewModel: loaderViewModel)
    }
}

struct FailureView: View {
    var msg: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(msg)
            
            Spacer()
        }
    }
}
