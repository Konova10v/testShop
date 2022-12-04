//
//  ProductModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import SwiftUI

struct ProductModel: Codable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
