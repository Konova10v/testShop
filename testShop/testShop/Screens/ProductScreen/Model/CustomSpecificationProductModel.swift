//
//  CustomSpecificationProductModel.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import Foundation

struct CustomSpecificationProductModel: Identifiable {
    var id = UUID()
    let specification: String
    var isActive: Bool
}
