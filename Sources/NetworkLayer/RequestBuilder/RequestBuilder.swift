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
    public func buildRequest(with url: URL) -> URLRequest {
        
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
    public func buildRequestWithBody(with url: URL, httpBody: Data?) -> URLRequest {
        
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
    
    public func buildCompoundMultipartRequest(
        url: URL,
        data: [String: (MultiPartFormDataType, Any)]
    ) throws -> URLRequest {
        let request: MultiPartRequsetable = MultiPartRequest(
            url: url,
            httpMehtod: endpoint.httpMethod,
            networkType: endpoint.networkService,
            headers: endpoint.headers,
            timeoutInterval: endpoint.timeoutInterval
        )
        
        buildBaseRequest(request: request)
        
        request.buildBoundary()
        request.buildBoundaryPrefix()
        request.buildBoundaryPostfix()
        request.setMultipartHeader()
        for field in data {
            
            if field.value.0 == .text {
                let fieldEncoding = request.buildTextMultiBody(with: field.key, value: field.value.1)
                request.httpBody?.append(fieldEncoding)
            }
            else if field.value.0 == .file {
                guard let data = field.value.1 as? Data else {
                    throw RequestBuilderError.noMultipartDataFound
                }
                let filename = field.key + UUID().uuidString
                let mime = MimeTypeExtractor.shared.mimeType(for: field.key)
                let fileData = request.setFileMutliBody(filename: filename, mime: mime, fileData: data)
                request.httpBody?.append(fileData)
            }
        }
        request.appendPostfixBoundry()
        request.request?.httpBody = request.httpBody
        return request.build()
    }
    
    //Multipart request for only files
    public func buildMultipartRequest(
        with url: URL,
        filename: String,
        filedata: Data?,
        mimeType: String
    ) throws -> URLRequest{
        
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
        
        let mime = MimeTypeExtractor.shared.mimeType(for: filename)
        buildBaseRequest(request: request)
        
        request.buildBoundary()
        request.buildBoundaryPrefix()
        request.buildBoundaryPostfix()
        request.handleFileName()
        request.setMultipartHeader()
        request.setFileMutliBody(filename: filename, mime: mime, fileData: filedata)
        request.appendPostfixBoundry()
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
