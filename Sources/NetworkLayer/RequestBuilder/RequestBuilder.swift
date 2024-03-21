//
//  RequestBuilder.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class RequestBuilder: RequestBuildable {
    
    private var endpoint: Requsetable
    
    init(endpoint: Requsetable){
        self.endpoint = endpoint
    }
    
    //Base request for get and head methods
    public func buildRequest(with url: URL) -> URLRequest? {
        
        let request: BaseRequestable = Request(
            url: url,
            httpMehtod: endpoint.httpMethod,
            networkType: endpoint.networkService,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval
        )
        buildBaseRequest(request: request)
        return request.build()
    }
    
    // POST JSON data
    public func buildRequestWithBody(with url: URL, httpBody: Data?) -> URLRequest? {
        
        let request: BaseRequestable = Request(
            url: url,
            httpMehtod: endpoint.httpMethod,
            networkType: endpoint.networkService,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval
        )
        
        buildBaseRequest(request: request)
        request.httpBody = httpBody
        request.setHttpBody()
        return request.build()
    }
    
    //Multipart request
    public func buildMultipartRequest(
        with url: URL,
        filename: String,
        filedata: Data?,
        mimeType: String
    ) throws -> URLRequest?{
        
        guard let filedata = filedata else {
            throw RequestBuilderError.noMultipartDataFound
        }
        
        let request: MultiPartRequsetable = MultiPartRequest(
            fileData: filedata,
            filename: filename,
            mimeType: mimeType,
            url: url,
            httpMehtod: endpoint.httpMethod,
            networkType: endpoint.networkService,
            headers: endpoint.headers ,
            timeoutInterval: endpoint.timeoutInterval
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
