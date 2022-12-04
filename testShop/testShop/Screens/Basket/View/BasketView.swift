//
//  BasketView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import SwiftUI

struct BasketView: View {
    @ObservedObject var viewModel = BasketViewModel()
    
    var body: some View {
        RemoteContentView(remoteContent: viewModel,
                          progress: {
                            LoaderView(viewModel: LoaderViewModel(showBack: false))
                          },
                          failure: {error, retry in
                            FailureView(msg: error.localizedDescription)
                          }) {response in
            createContentView(response: response)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder func createContentView(response: BasketViewModel.Value) -> some View {
        ZStack {
            Resources.Colors.background
            
            VStack(alignment: .leading) {
                BasketNavigationView()
                    .padding(.top, Screen.height < 670 ? 40 : 66)
                
                Spacer()
                
                Text("My Cart")
                    .font(.custom(Resources.Fonts.bold.rawValue, size: 35))
                    .foregroundColor(Resources.Colors.baseTextColor)
                    .padding(.leading, 30)
                
                Spacer()
                
                BasketOverView(model: response)
                    .frame(height: Screen.height / 1.4)
            }
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
