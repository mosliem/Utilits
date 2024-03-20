//
//  File.swift
//
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation

protocol APIExecuter {
    
    var endpoint: Requsetable { get set }
    var urlBuilder: URLBuildable { get set }
    var requestBuilder: RequestBuildable { get set }
    
    func executeRequest <modelType: Codable>(
        model: modelType.Type
    ) async throws -> modelType
    
    func executeRequestWithBody <modelType: Encodable> (
        model: modelType
    ) async throws -> Bool
    
    func executeRequest(
        fileName: String,
        fileData: Data
    ) async throws -> Bool
    
    func executeRequest() async throws -> Data
}
