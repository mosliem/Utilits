//
//  APIClient.swift
//
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation
import Combine
class APIClient: APIExecuter {
    
    var endpoint: Requsetable
    var urlBuilder: URLBuildable
    var requestBuilder: RequestBuildable
    init(endpoint: Requsetable, urlBuilder: URLBuildable, requestBuilder: RequestBuildable) {
        self.endpoint = endpoint
        self.urlBuilder = urlBuilder
        self.requestBuilder = requestBuilder
    }
    
    public func executeRequest <APIResponse: Codable>(
        model: APIResponse.Type,
        body: [String: String]? = nil
    )  -> AnyPublisher<APIResponse, APIError> {
        var url: URL!
        
        do{
            url = try urlBuilder.build()
            if let body {
                endpoint.httpBody = try JSONEncoder().encode(body)
            }
        }
        catch{
            print(URLError.urlComponentError.description)
        }
        
        let request = requestBuilder.buildRequest(with: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.requestFailed
                }
                
                guard response.statusCode < 300 else {
                    throw APIError.customError(statusCode: response.statusCode)
                }
                
                return data
            }
            .decode(type: model.self, decoder: JSONDecoder())
            .mapError({ error in
                return APIError.decodingFailed
            })
            .eraseToAnyPublisher()
        
    }
    
    
    //UplaodTask
    public func executeRequest <APIResponse: Codable>(
        fileName: String,
        fileData: Data,
        model: APIResponse.Type
    )  ->  AnyPublisher<APIResponse,APIError> {
        var url: URL
        var request: URLRequest!
        do{
            url = try urlBuilder.build()
            let mime = MimeTypeExtractor.shared.mimeType(for: fileName)
            request = try requestBuilder.buildMultipartRequest(with: url, filename: fileName, filedata: fileData, mimeType: mime)
        }
        catch let error as URLError where error == .hostError || error == .urlComponentError {
            print(error)
        }
        catch let error as RequestBuilderError where error == .noMultipartDataFound {
            print(error)
        }
        catch{
            print(error)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.requestFailed
                }
                
                guard response.statusCode < 300 else {
                    throw APIError.customError(statusCode: response.statusCode)
                }
                
                return data
            }
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .mapError({ error in
                return APIError.decodingFailed
            })
            .eraseToAnyPublisher()
    }
}
