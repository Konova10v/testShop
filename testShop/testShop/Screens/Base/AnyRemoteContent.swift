//
//  AnyRemoteContent.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Combine

final class AnyRemoteContent<Value> : RemoteContentViewModel {
    private let objectWillChangeClosure: () -> ObjectWillChangePublisher
    private let loadingStateClosure: () -> RemoteContentLoadingState<Value>
    private let loadClosure: () -> Void
    private let getPresentIsInternetNoConnectClosure: () -> Bool
    private let setPresentIsInternetNoConnectClosure: (Bool) -> ()
    private let getPresentSubscriptionsClosure: () -> Bool
    private let setPresentSubscriptionsClosure: (Bool) -> ()
    private let getSuccessSubscriptionCompletionClosure: () -> (() -> ())?
    private let setSuccessSubscriptionCompletionClosure: ((() -> ())?) -> ()
    
    var objectWillChange: ObservableObjectPublisher {
        objectWillChangeClosure()
    }
    
    var loadingState: RemoteContentLoadingState<Value> {
        loadingStateClosure()
    }
    
    var presentIsInternetNoConnect: Bool {
        get {
            getPresentIsInternetNoConnectClosure()
        }
        set {
            setPresentIsInternetNoConnectClosure(newValue)
        }
    }
    
    var presentSubscriptions: Bool {
        get {
            getPresentSubscriptionsClosure()
        }
        set {
            setPresentSubscriptionsClosure(newValue)
        }
    }
    
    var successSubscriptionCompletion: (() -> ())? {
        get {
            getSuccessSubscriptionCompletionClosure()
        }
        set {
            setSuccessSubscriptionCompletionClosure(newValue)
        }
    }
    
    init<R: RemoteContentViewModel>(_ remoteContent: R) where R.ObjectWillChangePublisher == ObjectWillChangePublisher,
                                                     R.Value == Value {
        objectWillChangeClosure = { [unowned remoteContent] in
            remoteContent.objectWillChange
        }
        
        loadingStateClosure = { [unowned remoteContent] in
            remoteContent.loadingState
        }
        
        loadClosure = { [unowned remoteContent] in
            remoteContent.load()
        }
        
        getPresentIsInternetNoConnectClosure = { [unowned remoteContent] in
            remoteContent.presentIsInternetNoConnect
        }
        
        setPresentIsInternetNoConnectClosure = { [unowned remoteContent] value in
            remoteContent.presentIsInternetNoConnect = value
        }
        
        getPresentSubscriptionsClosure = { [unowned remoteContent] in
            remoteContent.presentSubscriptions
        }
        
        setPresentSubscriptionsClosure = { [unowned remoteContent] value in
            remoteContent.presentSubscriptions = value
        }
        
        getSuccessSubscriptionCompletionClosure = { [unowned remoteContent] in
            remoteContent.successSubscriptionCompletion
        }
        
        setSuccessSubscriptionCompletionClosure = { [unowned remoteContent] value in
            remoteContent.successSubscriptionCompletion = value
        }
    }
    
    func load() {
        loadClosure()
    }
}
