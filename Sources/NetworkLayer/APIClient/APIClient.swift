//
//  APIClient.swift
//
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation

class APIClient: APIExecuter {
   
    
    var endpoint: Requsetable
    var urlBuilder: URLBuildable
    var requestBuilder: RequestBuildable

    init(endpoint: Requsetable, urlBuilder: URLBuildable, requestBuilder: RequestBuildable) {
        self.endpoint = endpoint
        self.urlBuilder = urlBuilder
        self.requestBuilder = requestBuilder
    }
    
    public func executeRequest <modelType: Codable>(
        model: modelType.Type
    ) async throws -> modelType {
        var url: URL
        
        do{
            url = try urlBuilder.build()
            let request = requestBuilder.buildRequest(with: url)
            let (data,_) = try await APIProvider.shared.executeRequest(request: request!)
            let decodedData = try JSONDecoder().decode(model.self, from: data)
            return decodedData

        }
        catch {
            throw error as? URLError ?? error
        }
    }
    
    public func executeRequestWithBody <modelType: Encodable> (
        model: modelType
    ) async throws -> Bool {
        var url: URL
        var jsonData: Data
        do{
            url = try urlBuilder.build()
            jsonData = try JSONEncoder().encode(model)
            let request = (requestBuilder.buildRequestWithBody(with: url, httpBody: jsonData))!
            let (_,response) = try await APIProvider.shared.executeRequest(request: request)
            return (response as? HTTPURLResponse)!.statusCode < 300
        }
        catch {
            throw error as? URLError ?? error
        }
        
    }
    
    //UplaodTask
    public func executeRequest(
        fileName: String,
        fileData: Data
    ) async throws -> Bool{
        var url: URL
        do{
            url = try urlBuilder.build()
        }
        catch {
            throw error as? URLError ?? error
        }
        
        let mime = MimeTypeExtractor.shared.mimeType(for: fileName)
        let request = requestBuilder.buildMultipartRequest(with: url, filename: fileName, filedata: fileData, mimeType: mime)
        let (_,response) = try await APIProvider.shared.executeRequest(request: request!)
        return (response as? HTTPURLResponse)!.statusCode < 300
    }
    

    public func executeRequest() async throws -> Data{
        do{
            let url = try urlBuilder.build()
            let request = (requestBuilder.buildRequest(with: url))!
            let (data,_) = try await APIProvider.shared.executeRequest(request: request)
            return data
        }
        catch{
            throw error
        }
    }
    
    
}
