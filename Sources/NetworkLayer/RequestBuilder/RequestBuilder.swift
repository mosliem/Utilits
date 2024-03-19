//
//  RequestBuilder.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class RequestBuilder {
    
    private var endpoint: Requsetable
    
    init(endpoint: Requsetable){
        self.endpoint = endpoint
    }

    //Base request for get and head methods
    public func build(
        with url: URL,
        httpMethod: HTTPMethod? = nil,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) -> URLRequest? {
        
        let request = buildBaseRequest(
            with: url,
            httpMethod: endpoint.httpMethod,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval,
            networkService: endpoint.networkService
        )
        
        return request.build()
    }
    
    // POST JSON data
    public func build(
        with url: URL,
        httpMethod: HTTPMethod? = nil,
        httpBody: Data,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) -> URLRequest? {
        
        let request = buildBaseRequest(
            with: url,
            httpMethod: endpoint.httpMethod,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval,
            networkService: endpoint.networkService
        )
        
        request.httpBody = httpBody
        request.setHttpBody()
        
        return request.build()
    }
    
    //Multipart request
//    public func build(with data: Data?, mimeType: String, filename: String){
//        
//    }
    
    
    //MARK: - Helper function
    
    private func buildBaseRequest(
        with url: URL,
        httpMethod: HTTPMethod? = nil,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) -> BaseRequest{
        
        let request: BaseRequest = Request(
            url: url,
            httpMehtod: endpoint.httpMethod,
            networkType: endpoint.networkService,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval
        )
        
        request.inializedRequest()
        request.setHttpMethod()
        
        if  headers != nil {
            request.setHttpHeaders()
        }
        
        if timeoutInterval != nil {
            request.setTimeInterval()
        }
        
        if  networkService != nil {
            request.setNetworkType()
        }
        
        return request
    }
}
