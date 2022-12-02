//
//  ApiWrapper.swift
//  testShop
//
//  Created by Кирилл Коновалов on 02.12.2022.
//

import Foundation
import Alamofire

final class ApiWrapper: NSObject {
    typealias CompletionHandler<T> = Swift.Result<T, Error>
    
    private static func getDataRequest(path: String,
                                       parameters: Parameters,
                                       headers: [String: String]) -> DataRequest {
        let url = path
        
        let httpHeaders = HTTPHeaders(headers)

        return AF.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: httpHeaders)
            .responseJSON { response in
                print("""
                      === HTTP Response ===
                      path: \(path)
                      \(response.description)
                      """)
            }
    }
    
    private static func request<Model: Decodable>(path: String,
                                                  parameters: Parameters = [:],
                                                  headers: [String: String] = [:],
                                                  completion: @escaping (CompletionHandler<Model>) -> Void) {
        getDataRequest(path: path, parameters: parameters, headers: headers)
            .responseDecodable(of: Model.self, queue: .global(qos: .utility)) { response in
                DispatchQueue.main.async {
                    switch response.result {
                    case .success(let model): completion(.success(model))
                    case .failure(let error): completion(.failure(error))
                    }
                }
            }
    }
    
    static func mainScreen(completion: @escaping (CompletionHandler<MainScreenModel>) -> Void) {
        request(path: ServerConstants.mainScreen, completion: completion)
    }
}
