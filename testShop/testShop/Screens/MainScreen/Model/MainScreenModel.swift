//
//  MainScreenModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//


import SwiftUI

struct MainScreenModel: Codable {
    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]
    
    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

struct HomeStore: Codable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy : Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title, subtitle, picture
        case isNew = "is_new"
        case isBuy = "is_buy"
    }
}

struct BestSeller: Codable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String

    enum CodingKeys: String, CodingKey {
        case id, title, picture
        case isFavorites = "is_favorites"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
    }
}
