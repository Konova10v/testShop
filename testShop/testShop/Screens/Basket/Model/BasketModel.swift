//
//  BasketModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 04.12.2022.
//

import Foundation

struct BasketModel: Codable {
    let basket: [BasketItem]
    let delivery: String
    let id: String
    let total: Int
}

struct BasketItem: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
