//
//  LoadingView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI

struct LoaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: LoaderViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack() {
                Spacer()
                ActivityIndicator()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Resources.Colors.orange)
                Spacer()
            }
            
            if viewModel.showBack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("back_action")
                        .renderingMode(.template)
                        .foregroundColor(Color(viewModel.color))
                })
                .frame(width: 40, height: 40)
                .background(BlurView(style: .light)
                                .cornerRadius(8))
                .padding(.top, 52)
                .padding(.leading, 16)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                        .scaleEffect(calcScale(index: index))
                        .offset(y: calcYOffset(geometry))
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                    .animation(Animation
                                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                                .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
    
    func calcScale(index: Int) -> CGFloat {
        return (!isAnimating ? 1 - CGFloat(Float(index)) / 5 : 0.2 + CGFloat(index) / 5)
    }
    
    func calcYOffset(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width / 10 - geometry.size.height / 2
    }
    
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        let loaderViewModel = LoaderViewModel(showBack: true)
        
        LoaderView(viewModel: loaderViewModel)
    }
}

struct FailureView: View {
    var msg: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(msg)
            
            Spacer()
        }
    }
}
