//
//  MainScreenView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel = MainScreenViewModel()
    
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
    
    @ViewBuilder func createContentView(response: MainScreenViewModel.Value) -> some View {
        ZStack {
            Resources.Colors.background
            
            VStack {
             LocationAndFilterView()
                    .padding(.top, 66)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
