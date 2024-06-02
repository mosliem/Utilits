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
        body: [String: Any]? = nil
    )  -> AnyPublisher<APIResponse, APIError> {
        var url: URL!
        
        do{
            url = try urlBuilder.build()
            if let body, !body.isEmpty {
                endpoint.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
            }
            print(String(data: endpoint.httpBody!, encoding: .utf8))
        }
        catch{
            print(URLError.urlComponentError.description)
        }
        
        var request: URLRequest
        
        if let data = endpoint.httpBody {
            request = requestBuilder.buildRequestWithBody(with: url, httpBody: data)
        }
        else {
            request = requestBuilder.buildRequest(with: url)
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
            .decode(type: model.self, decoder: JSONDecoder())
            .mapError({ error in
                return APIError.decodingFailed
            })
            .eraseToAnyPublisher()
        
    }
    
    public func executeRequest<APIResponse: Codable>(
        data: [String: (MultiPartFormDataType, Any)],
        model: APIResponse.Type
    ) -> AnyPublisher <APIResponse, APIError>  {
        
        var url: URL
        var request: URLRequest!
        
        do{
            url = try urlBuilder.build()
            request = try requestBuilder.buildCompoundMultipartRequest(url: url, data: data)
        }
        catch let error as URLError where error == .hostError || error == .urlComponentError {
            print(error.description)
        }
        catch let error as RequestBuilderError where error == .noMultipartDataFound {
            print(error.description)
        }
        catch{
            print(error.localizedDescription)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response in
               try? self.parseResponse(from: data, model: model.self)
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
    
    func parseResponse <T:Codable>(from data: Data, model: T.Type) throws  {
        let decoder = JSONDecoder()

        do {
             try decoder.decode(T.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Decoding error (keyNotFound): \(key) not found in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Decoding error (dataCorrupted): data corrupted in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Decoding error (typeMismatch): type mismatch of \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(type, context) {
            print("Decoding error (valueNotFound): value not found for \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        }

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
            print(error.description)
        }
        catch let error as RequestBuilderError where error == .noMultipartDataFound {
            print(error.description)
        }
        catch{
            print(error.localizedDescription)
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
