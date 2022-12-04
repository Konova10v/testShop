//
//  BasketViewModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import Foundation

class BasketViewModel: RemoteContentViewModel {
    typealias Value = BasketModel
    
    private(set) var isInitialLoading: Bool = true
    @Published var presentIsInternetNoConnect = false
    @Published private(set) var loadingState: RemoteContentLoadingState<Value> = .loading(isInitial: true)
    
    @Published var presentSubscriptions = false
    
    var successSubscriptionCompletion: (() -> ())? = nil
    
    @Published var model: BasketModel?
    
    @Published var image: [Card] = []
    
    init() {
        successSubscriptionCompletion = self.load
    }
    
    @objc func load() {
        loadingState = .loading(isInitial: isInitialLoading)
        
        ApiWrapper.basketScreen() { [weak self] (response) in
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
