//
//  Categories.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct CategoriesModel: Identifiable {
    var id = UUID()
    let name: String
    let image: String
    var isActive: Bool
}


struct Categories: View {
    
    @State var categories: [CategoriesModel] = [
        CategoriesModel(name: "Phones",
                        image: "phone",
                        isActive: true),
        CategoriesModel(name: "Computer",
                        image: "computer",
                        isActive: false),
        CategoriesModel(name: "Health",
                        image: "health",
                        isActive: false),
        CategoriesModel(name: "Books",
                        image: "books",
                        isActive: false),
        CategoriesModel(name: "Phones",
                        image: "phone",
                        isActive: false),
        CategoriesModel(name: "Computer",
                        image: "computer",
                        isActive: false),
        CategoriesModel(name: "Health",
                        image: "health",
                        isActive: false),
        CategoriesModel(name: "Books",
                        image: "books",
                        isActive: false),
    
    ]
    
    var body: some View {
        VStack(spacing: 24) {
            HStack() {
                Text("Select Category")
                    .font(.custom(Resources.Fonts.bold.rawValue, size: 25))
                    .foregroundColor(Resources.Colors.baseTextColor)
                
                Spacer()
                
                Button {
                } label: {
                    Text("view all")
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 15))
                        .foregroundColor(Resources.Colors.orange)
                }
            }
            .padding(.leading, 17)
            .padding(.trailing, 33)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 17) {
                    ForEach(categories.indices) { categorie in
                        Button(action: {
                            if !categories[categorie].isActive {
                                for (index, _) in categories.enumerated() {
                                    categories[index].isActive = false
                                }
                                
                                categories[categorie].isActive = true
                            }
                        }) {
                            VStack(spacing: 7) {
                                Image(categories[categorie].image)
                                    .renderingMode(.template)
                                    .foregroundColor(categories[categorie].isActive ? Color.white : Resources.Colors.colorIconCategorie)
                                    .frame(width: 71, height: 71)
                                    .background(categories[categorie].isActive ? Resources.Colors.orange : Color.white)
                                    .clipShape(Circle())
                                
                                Text(categories[categorie].name)
                                    .font(.custom(Resources.Fonts.medium.rawValue, size: 12))
                                    .foregroundColor(categories[categorie].isActive ? Resources.Colors.orange : Resources.Colors.baseTextColor)
                            }
                        }
                    }
                }
                .padding(.horizontal, 27)
            }
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}

