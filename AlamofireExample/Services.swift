//
//  Services.swift
//  AlamofireExample
//
//  Created by Ruken SANCAR on 3.10.2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class Services {
    static let sharedInstance = Services()
    
    func postDataToWebService (urlExtra: String!, parameters: [String: Any]) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString,
                       method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default).response { response in
                        switch response.result {
                        case .success:
                            print("Post Request Is Successful")
                        case let .failure(error):
                            print("Post Request Is Failed", error)
                        }
                       }
        }
    }
    
    func postDataToWebServiceWithVariables (urlExtra: String!, parameters: [String: Any]) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString,
                       method: .post,
                       parameters: parameters,
                       encoding: URLEncoding(destination: .queryString)).response { response in
                        switch response.result {
                        case .success:
                            print("Post Request Is Successful")
                        case let .failure(error):
                            print("Post Request Is Failed", error)
                        }
                       }
        }
    }
    
    
    func getDataFromWebService<M: Codable>(urlExtra: String!,
                                           parameters: [String: Any],
                                           with type: M.Type,
                                           completion: @escaping (Swift.Result<M, Error>) -> Void) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString, parameters: parameters, encoding: URLEncoding.default).validate().responseJSON { (response) in
                switch response.result {
                case .success:
                    do {
                        if let resultValue = response.value {
                            let jsonData = try JSONSerialization.data(withJSONObject: resultValue, options: .prettyPrinted)
                            let jsonResults = try JSONDecoder().decode(type, from: jsonData)
                            completion(.success(jsonResults))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getDataFromWebServiceWithoutModel(urlExtra: String!,
                                           parameters: [String: Any],
                                           completion: @escaping (Swift.Result<Any, Error>) -> Void) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString, parameters: parameters, encoding: URLEncoding.default).validate().responseJSON { (response) in
                switch response.result {
                case .success:
                    if let resultValue = response.value {
                        completion(.success(resultValue))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func deleteFromWebService (urlExtra: String!, parameters: [String: Any]) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString,
                       method: .delete,
                       parameters: parameters).response { response in
                        switch response.result {
                        case .success:
                            print("Delete Request Is Successful")
                        case let .failure(error):
                            print("Delete Request Is Failed", error)
                        }
                       }
        }
    }
    
    func putDataToWebService (urlExtra: String!, parameters: [String: Any]) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString,
                       method: .put,
                       parameters: parameters, encoding: URLEncoding(destination: .httpBody))
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        print(response.result)
                        print("Put Request Is Successful")
                    case let .failure(error):
                        print("Put Request Is Failed", error)
                    }
                }
        }
    }
    
    func putDataToWebServiceWithModelParamater (urlExtra: String!, parameters: [String: Any]) {
        let onJsonReachability: NetworkReachabilityManager = NetworkReachabilityManager()!
        if onJsonReachability.isReachable {
            let urlString = String(format: "%@%@", Constant.baseURL, urlExtra)
            print(urlString, "\n", parameters)
            Alamofire.Session.default.session.configuration.timeoutIntervalForRequest = 100
            AF.request(urlString,
                       method: .put,
                       parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        print(response.result)
                        debugPrint(response)
                        print("Put Request Is Successful")
                    case let .failure(error):
                        print("Put Request Is Failed", error)
                    }
                }
        }
    }
}
