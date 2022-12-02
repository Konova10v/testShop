//
//  RemoteContentView.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import SwiftUI
import Combine

struct RemoteContentView<Value, Progress, Failure, Content> : View where Progress : View,
                                                                         Failure : View,
                                                                         Content : View {
    let progress: () -> Progress
    let failure: (_ error: Error, _ retry: @escaping () -> Void) -> Failure
    let content: (_ value: Value) -> Content
    let needLoadOnAppear: Bool
    
    @ObservedObject private var remoteContent: AnyRemoteContent<Value>
    
    init<R: RemoteContentViewModel>(remoteContent: R,
                           progress: @escaping () -> Progress,
                           failure: @escaping (_ error: Error, _ retry: @escaping () -> Void) -> Failure,
                           content: @escaping (_ value: Value) -> Content,
                           needLoadOnAppear: Bool = true)
    where R.ObjectWillChangePublisher == ObservableObjectPublisher,
          R.Value == Value
    {
        self.remoteContent = AnyRemoteContent(remoteContent)
        
        self.progress = progress
        self.failure = failure
        self.content = content
        self.needLoadOnAppear = needLoadOnAppear
    }
    
    var body: some View {
        ZStack {
            Color.white
                 .edgesIgnoringSafeArea(.all)
            
            switch remoteContent.loadingState {
            case .loading(let isInitial):
                if isInitial {
                    progress()
                } else {
                    progress()
                    //LottieView(name: "loader")
                }
            case .success(let value):
                content(value)
                
            case .failure(let error):
                failure(error) {
                    remoteContent.load()
                }
            }
        }
        .onAppear {
            if needLoadOnAppear {
                remoteContent.load()
            }
        }
    }
}

