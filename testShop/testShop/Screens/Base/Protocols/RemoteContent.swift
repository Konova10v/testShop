//
//  RemoteContent.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation

protocol RemoteContent: ObservableObject {
    associatedtype Value
    
    var loadingState: RemoteContentLoadingState<Value> { get }
    func load()
}
