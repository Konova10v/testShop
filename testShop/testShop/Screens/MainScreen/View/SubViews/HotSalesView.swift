//
//  HotSalesView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct HotSalesView: View {
    @State var model: MainScreenViewModel.Value
    @State var selectTabIndex = 0
    
    
    var body: some View {
        VStack(spacing: 10) {
            HStack() {
                Text("Hot sales")
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
            
            
            TabView(selection: $selectTabIndex) {
                ForEach(model.homeStore.indices, id: \.self) { idx in
                    ZStack(alignment: .topLeading) {
                        WebImage(url: URL(string: model.homeStore[idx].picture))
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: Screen.width - 30,
                                   height: 182,
                                   alignment: .center)
                            .scaledToFill()
                        
                        VStack(alignment: .leading) {
                            if model.homeStore[idx].isNew != nil {
                                ZStack {
                                  Circle()
                                        .foregroundColor(Resources.Colors.orange)
                                  
                                  Text("New")
                                        .font(.custom(Resources.Fonts.bold.rawValue, size: 10))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 27, height: 27)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(model.homeStore[idx].title)
                                    .font(.custom(Resources.Fonts.bold.rawValue, size: 25))
                                    .foregroundColor(.white)
                                
                                Text(model.homeStore[idx].subtitle)
                                    .font(.custom(Resources.Fonts.regular.rawValue, size: 11))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            if model.homeStore[idx].isBuy {
                                Button {
                                } label: {
                                    Text("Buy now!")
                                        .font(.custom(Resources.Fonts.bold.rawValue, size: 11))
                                        .foregroundColor(Resources.Colors.baseTextColor)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 27)
                                        .background(.white)
                                        .cornerRadius(5)
                                }
                            }
                        }
                        .padding(.top, 14)
                        .padding(.leading, 25)
                        .padding(.bottom, 25)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: Screen.width - 30,
                   height: 182,
                   alignment: .center)
        }
    }
}

//struct HotSalesView_Previews: PreviewProvider {
//    static var previews: some View {
//        HotSalesView()
//    }
//}
