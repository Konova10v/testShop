//
//  ProdectView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import SwiftUI

struct ProdectView: View {
    @ObservedObject var viewModel = ProdectViewModel()
    @StateObject var contentViewModel = ContentViewModel()
    
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
        .onDisappear {
            viewModel.image.removeAll()
            viewModel.colors.removeAll()
            viewModel.memory.removeAll()
        }
    }
    
    @ViewBuilder func createContentView(response: ProdectViewModel.Value) -> some View {
        ZStack {
            Resources.Colors.background
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ProductNavigationView()
                        .padding(.top, Screen.height < 670 ? 40 : 66)
                    
                    CaruselImageView(items: viewModel.image)
                        .padding(.top, 10)
                        .environmentObject(contentViewModel.stateModel)
                    
                    Spacer()
                    
                    ProdectDescription(viewModel: viewModel, model: response)
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

struct ProdectView_Previews: PreviewProvider {
    static var previews: some View {
        ProdectView()
    }
}
