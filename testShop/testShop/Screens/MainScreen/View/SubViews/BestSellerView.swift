//
//  BestSellerView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct BestSellerView: View {
    @State var model: MainScreenViewModel.Value
    var gridItemLayout = [GridItem(.flexible(minimum: 30)), GridItem(.flexible(minimum: 30))]
    
    var body: some View {
        VStack(spacing: 18) {
            HStack() {
                Text("Best Seller")
                    .font(.custom(Resources.Fonts.bold.rawValue, size: 25))
                    .foregroundColor(Resources.Colors.baseTextColor)
                
                Spacer()
                
                Button {
                } label: {
                    Text("see more")
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 15))
                        .foregroundColor(Resources.Colors.orange)
                }
            }
            .padding(.leading, 17)
            .padding(.trailing, 33)
            
            
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                ForEach(model.bestSeller,  id: \.id) { sale in
                    NavigationLink(destination: ProdectView()) {
                        VStack(alignment: .leading) {
                            ZStack(alignment: .topTrailing) {
                                WebImage(url: URL(string: sale.picture))
                                    .resizable()
                                    .clipped()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: Screen.width / 2 - 20, height: 168, alignment: .center)
                                    .padding(.top, 5)
                                
                                Button {
                                    
                                } label: {
                                    Image(sale.isFavorites ? "favoriteActive" : "favoriteNoActive")
                                        .renderingMode(.template)
                                        .foregroundColor(Resources.Colors.orange)
                                        .frame(width: 25, height: 25)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                .padding(.top, 12)
                                .padding(.trailing, 12)
                            }
                            
                            HStack(spacing: 7) {
                                Text("$\(sale.priceWithoutDiscount)")
                                    .font(.custom(Resources.Fonts.bold.rawValue, size: 16))
                                    .foregroundColor(Resources.Colors.baseTextColor)
                                
                                Text("$\(sale.discountPrice)")
                                    .font(.custom(Resources.Fonts.medium.rawValue, size: 10))
                                    .foregroundColor(Color.init(hex: "CCCCCC"))
                                    .strikethrough()
                            }
                            .padding(.horizontal, 21)
                            .padding(.top, 5)
                            
                            Text(sale.title)
                                .font(.custom(Resources.Fonts.regular.rawValue, size: 10))
                                .foregroundColor(Resources.Colors.baseTextColor)
                                .padding(.horizontal, 21)
                                .padding(.bottom, 15)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 14)
        }
    }
}
