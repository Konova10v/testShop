//
//  RemoteContentLoadingState.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation

enum RemoteContentLoadingState<Value> {
    case loading(isInitial: Bool)
    case success(_ value: Value)
    case failure(_ error: Error)
}
