//
//  LoaderViewModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation

class LoaderViewModel: ObservableObject {
    @Published var showBack: Bool
    let color: String
    
    init(showBack: Bool, color: String = "black") {
        self.showBack = showBack
        self.color = color
    }
}
