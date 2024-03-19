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
        httpMethod: HTTPMethod,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) -> URLRequest? {
        
        let request: BaseRequestable = Request(
            url: url,
            httpMehtod: httpMethod,
            networkType: networkService ?? endpoint.networkService,
            headers: headers ?? endpoint.headers, 
            timeoutInterval: timeoutInterval ?? endpoint.timeoutInterval
        )
        buildBaseRequest(request: request)
        return request.build()
    }
    
    // POST JSON data
    public func build(
        with url: URL,
        httpMethod: HTTPMethod,
        httpBody: Data,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil
    ) -> URLRequest? {
        
        let request: BaseRequestable = Request(
            url: url,
            httpMehtod: httpMethod,
            networkType: networkService ?? endpoint.networkService,
            headers: headers ?? endpoint.headers,
            timeoutInterval: timeoutInterval ?? endpoint.timeoutInterval
        )
        
        buildBaseRequest(request: request)
        request.httpBody = httpBody
        request.setHttpBody()
        return request.build()
    }
    
    //Multipart request
    public func build(
        with url: URL,
        httpMethod: HTTPMethod,
        headers: [String: String]? = nil,
        timeoutInterval: TimeInterval? = nil,
        networkService: URLRequest.NetworkServiceType? = nil,
        with data: Data,
        mimeType: String,
        filename: String
    ) -> URLRequest?{
        
        let request: MultiPartRequsetable = MultiPartRequest(
            fileData: data,
            filename: filename,
            mimeType: mimeType,
            url: url,
            httpMehtod: httpMethod,
            networkType: networkService ?? .default,
            headers: headers ?? endpoint.headers ,
            timeoutInterval: timeoutInterval ?? endpoint.timeoutInterval
        )
        
        buildBaseRequest(request: request)
        
        request.buildBoundary()
        request.buildBoundaryPrefix()
        request.buildBoundaryPostfix()
        request.handleFileName()
        request.setMultipartHeader()
        request.buildBody()
        request.setHttpBody()
        
        return request.build()
    }
    
    
    //MARK: - Helper function
    @discardableResult
    private func buildBaseRequest<RequestType: BaseRequestable>(
        request: RequestType
    ) -> BaseRequestable{
    
        
        request.inializedRequest()
        request.setHttpMethod()
        request.setHttpHeaders()
        request.setTimeInterval()
        request.setNetworkType()
    
        return request
    }
}
