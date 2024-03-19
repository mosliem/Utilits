//
//  Request.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class Request{
    
    private var url: URL
    private var httpMehtod: HTTPMethod
    private var networkType: URLRequest.NetworkServiceType
    private var headers: [String: String]
    private var httpBody: Data?
    private var timeoutInterval: TimeInterval
    
    private var request: URLRequest?
    
    init(
        url: URL,
        httpMehtod: HTTPMethod,
        networkType: URLRequest.NetworkServiceType,
        headers: [String : String],
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
    
    public func inializedRequest() {
        request = URLRequest(url: url)
    }
    
    public func setHttpMethod(){
        request?.httpMethod = httpMehtod.rawValue
    }
    
    public func setHttpHeaders(){
        request?.allHTTPHeaderFields = headers
    }
    
    public func setHttpBody(){
        request?.httpBody = httpBody
    }
 
    public func setNetworkType(){
        request?.networkServiceType = networkType
    }
}
