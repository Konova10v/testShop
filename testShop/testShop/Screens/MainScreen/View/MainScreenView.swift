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
        NavigationView {
            ZStack(alignment: .bottom) {
                Resources.Colors.background
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        LocationAndFilterView(viewModel: viewModel)
                            .padding(.top, Screen.height < 670 ? 40 : 66)
                        
                        Categories()
                            .padding(.top, 18)
                        
                        SearchView()
                            .padding(.top, 30)
                        
                        HotSalesView(model: response)
                            .padding(.top, 25)
                        
                        BestSellerView(model: response)
                            .padding(.top, 15)
                            .padding(.bottom, 100)
                        
                        Spacer()
                    }
                }
                
                TabBarView()
                    .padding(.bottom, 2)
                
                BottomSheet(isShowing: $viewModel.isShowingBottomSheet, content: presentFilterView())
            }
            .ignoresSafeArea()
            .onTapGesture {
                self.endEditing()
            }
        }
    }
    
    func presentFilterView() -> AnyView {
        return AnyView(FilterView(viewModel: viewModel))
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

