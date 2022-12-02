//
//  MainScreenViewModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation

class MainScreenViewModel: RemoteContentViewModel {
    typealias Value = MainScreenModel
    
    private(set) var isInitialLoading: Bool = true
    @Published var presentIsInternetNoConnect = false
    @Published private(set) var loadingState: RemoteContentLoadingState<Value> = .loading(isInitial: true)
    
    @Published var presentSubscriptions = false
    
    var successSubscriptionCompletion: (() -> ())? = nil
    
    @Published var model: MainScreenModel?
    
    init() {
        successSubscriptionCompletion = self.load
    }
    
    
    @objc func load() {
        loadingState = .loading(isInitial: isInitialLoading)
        
        ApiWrapper.mainScreen() { [weak self] (response) in
            switch response {
            case .success(let model):
                DispatchQueue.main.async { [weak self] in
                    self?.model = model
                    
                    self?.loadingState = .success(model)
                    
                    self?.isInitialLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.isInitialLoading = true
                    self?.loadingState = .failure(error)
                }
            }
        }
    }
}
