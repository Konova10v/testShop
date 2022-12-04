//
//  ProdectDescription.swift
//  testShop
//
//  Created by Кирилл Коновалов on 03.12.2022.
//

import SwiftUI

struct ProdectDescription: View {
    @ObservedObject var viewModel: ProdectViewModel
    @State var model: ProdectViewModel.Value
    
    @State var select: Int = 0
    var items = ["Shop", "Details", "Features"]
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(model.title)
                        .font(.custom(Resources.Fonts.medium.rawValue, size: 24))
                        .foregroundColor(Resources.Colors.baseTextColor)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(model.isFavorites ? "favoriteActive" : "favoriteNoActive")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    .frame(width: 37, height: 37)
                    .background(Resources.Colors.baseTextColor)
                    .cornerRadius(10)
                    
                }
                .padding(.top, 20)
                
                StarsView(rating: model.rating, maxRating: 5)
            }
            .padding(.horizontal, 30)
            
            SegmentControlView(items: items, selection: $select)
            
            HStack {
                VStack(spacing: 5) {
                    Image("cpu")
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text(model.CPU)
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 11))
                        .foregroundColor(Color.init(hex: "B7B7B7"))
                }
                .frame(width: Screen.width / 5)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("camera")
                        .frame(width: 28, height: 28)
                    Text(model.camera)
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 11))
                        .foregroundColor(Color.init(hex: "B7B7B7"))
                }
                .frame(width: Screen.width / 5)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("ram")
                        .frame(width: 28, height: 28)
                    Text(model.ssd)
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 11))
                        .foregroundColor(Color.init(hex: "B7B7B7"))
                }
                .frame(width: Screen.width / 5)
                
                Spacer()
                
                VStack(spacing: 5) {
                    Image("memory")
                        .frame(width: 28, height: 28)
                    Text(model.sd)
                        .font(.custom(Resources.Fonts.regular.rawValue, size: 11))
                        .foregroundColor(Color.init(hex: "B7B7B7"))
                }
                .frame(width: Screen.width / 5)
            }
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Select color and capacity")
                    .font(.custom(Resources.Fonts.medium.rawValue, size: 16))
                    .foregroundColor(Resources.Colors.baseTextColor)
                
                HStack() {
                    HStack(spacing: 18.75) {
                        if !viewModel.colors.isEmpty {
                            ForEach(viewModel.colors.indices) { color in
                                Button {
                                    if !viewModel.colors[color].isActive {
                                        for (index, _) in viewModel.colors.enumerated() {
                                            viewModel.colors[index].isActive = false
                                        }
                                    }
                                    viewModel.colors[color].isActive = true
                                } label: {
                                    if viewModel.colors[color].isActive {
                                        Image("select")
                                            .frame(width: 39, height: 39)
                                            .background(Color.init(hex: viewModel.colors[color].specification))
                                            .clipShape(Circle())
                                    } else {
                                        Circle()
                                            .fill(Color.init(hex: viewModel.colors[color].specification))
                                            .frame(width: 39, height: 39)
                                            
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        if !viewModel.memory.isEmpty {
                            ForEach(viewModel.memory.indices) { itemIndex in
                                Button {
                                    if !viewModel.memory[itemIndex].isActive {
                                        for (index, _) in viewModel.memory.enumerated() {
                                            viewModel.memory[index].isActive = false
                                        }
                                    }
                                    viewModel.memory[itemIndex].isActive = true
                                } label: {
                                    Text(viewModel.memory[itemIndex].isActive ? viewModel.memory[itemIndex].specification.uppercased() : viewModel.memory[itemIndex].specification)
                                        .font(.custom(Resources.Fonts.bold.rawValue, size: 13))
                                        .foregroundColor(viewModel.memory[itemIndex].isActive ?  .white : Color.init(hex: "8D8D8D"))
                                        .frame(width: 71.43, height: 30.36)
                                        .background(viewModel.memory[itemIndex].isActive ? Resources.Colors.orange : .white)
                                        .cornerRadius(10)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 30)
            
            Button {
                
            } label: {
                HStack {
                    Text("Add to Cart")
                        .font(.custom(Resources.Fonts.bold.rawValue, size: 20))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(model.price)")
                        .font(.custom(Resources.Fonts.bold.rawValue, size: 20))
                        .foregroundColor(.white)
                }
                .padding(.trailing, 45)
                .padding(.leading, 38)
            }
            .frame(width: Screen.width - 60, height: 54)
            .background(Resources.Colors.orange)
            .cornerRadius(10)
            .padding(.bottom, 30)
        }
        .background(RoundedCorners(topLeft: 30,
                                   topRight: 30,
                                   bottomLeft: 0,
                                   bottomRight: 0)
            .fill(Color.white))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
