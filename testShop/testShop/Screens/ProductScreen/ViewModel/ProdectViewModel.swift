//
//  ProdectViewModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import Foundation

class ProdectViewModel: RemoteContentViewModel {
    typealias Value = ProductModel
    
    private(set) var isInitialLoading: Bool = true
    @Published var presentIsInternetNoConnect = false
    @Published private(set) var loadingState: RemoteContentLoadingState<Value> = .loading(isInitial: true)
    
    @Published var presentSubscriptions = false
    
    var successSubscriptionCompletion: (() -> ())? = nil
    
    @Published var model: ProductModel?
    
    @Published var image: [Card] = []
    
    @Published var colors: [CustomSpecificationProductModel] = []
    
    @Published var memory: [CustomSpecificationProductModel] = []
    
    init() {
        successSubscriptionCompletion = self.load
    }
    
    @objc func load() {
        loadingState = .loading(isInitial: isInitialLoading)
        
        ApiWrapper.productScreen() { [weak self] (response) in
            switch response {
            case .success(let model):
                DispatchQueue.main.async { [weak self] in
                    self?.model = model
                    
                    self?.loadingState = .success(model)
                    
                    self?.isInitialLoading = false
                    
                    var count = 0
                    for item in model.images {
                        self?.image.append(Card(id: count, name: item))
                        count += 1
                    }
                    
                    var countColors = 0
                    for item in model.color {
                        self?.colors.append(CustomSpecificationProductModel(specification: item, isActive: countColors == 0 ? true : false))
                        countColors += 1
                    }
                    
                    var countMemory = 0
                    for item in model.capacity {
                        self?.memory.append(CustomSpecificationProductModel(specification: item, isActive: countMemory == 0 ? true : false))
                        countMemory += 1
                        
                    }
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
