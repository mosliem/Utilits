//
//  File.swift
//  
//
//  Created by mohamed sliem on 19/03/2024.
//

import Foundation

 protocol BaseRequestable: AnyObject{
    
    var url: URL { get set }
    var httpMehtod: HTTPMethod { get set }
    var networkType: URLRequest.NetworkServiceType { get set }
    var headers: [String: String] { get set }
    var httpBody: Data? { get set }
    var timeoutInterval: TimeInterval { get set }
    
    var request: URLRequest? { get set }
    
     func inializedRequest()
     func setHttpMethod()
     func setHttpHeaders()
     func setHttpBody()
     func setNetworkType()
     func setTimeInterval()
     func build() -> URLRequest?
}

extension BaseRequestable {
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
    
    public func setTimeInterval(){
        request?.timeoutInterval = timeoutInterval
    }
    
    public func build() -> URLRequest? {
        return request
    }
}
