//
//  Request.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class Request{
    
    private var httpMehtod: HTTPMethod
    private var networkType: URLRequest.NetworkServiceType
    private var headers: [String : String]
    private var httpBody: Data?
    private var timeoutInterval: TimeInterval?
    
    init(
        httpMehtod: HTTPMethod,
        networkType: URLRequest.NetworkServiceType,
        headers: [String : String],
        httpBody: Data? = nil,
        timeoutInterval: TimeInterval? = 60
    ) {
        self.httpMehtod = httpMehtod
        self.networkType = networkType
        self.headers = headers
        self.httpBody = httpBody
        self.timeoutInterval = timeoutInterval
    }
}
