//
//  RemoteContentViewModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation

protocol RemoteContentViewModel: RemoteContent {
    var presentIsInternetNoConnect: Bool { get set }
    var presentSubscriptions: Bool { get set }
    var successSubscriptionCompletion: (() -> ())? { get set }
}
