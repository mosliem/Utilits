//
//  EndpointRequsetable.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

public protocol Requsetable {
    
    //MARK: - URL
    var schema: String { get }
    var host: String { get }
    var path: String {get}
    var queryParameters: [String: Any] {get set}
    
    //MARK: - Request Parameters
    var headers: [String: String] { get set }
    var httpMethod: HTTPMethod { get }
    var httpBody:  [String: Any] {get set}
}

extension Requsetable {
    var queryParameters: [String: Any] {
        return [:]
    }
    
    var httpBody: [String: Any] {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }

}

