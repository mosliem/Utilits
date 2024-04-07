//
//  Request.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class Request: BaseRequestable{
    
    var url: URL
    var httpMehtod: HTTPMethod
    var networkType: URLRequest.NetworkServiceType?
    var headers: [String: String]?
    var httpBody: Data?
    var timeoutInterval: TimeInterval?
    
    var request: URLRequest?
    
    init(
        url: URL,
        httpMehtod: HTTPMethod,
        networkType: URLRequest.NetworkServiceType,
        headers: [String : String]?,
        httpBody: Data? = nil,
        timeoutInterval: TimeInterval
    ) {
        self.url = url
        self.httpMehtod = httpMehtod
        self.networkType = networkType
        self.headers = headers
        self.httpBody = httpBody
        self.timeoutInterval = timeoutInterval
    }
}
