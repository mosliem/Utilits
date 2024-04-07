//
//  File.swift
//
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation
import Combine

protocol APIExecuter {
    
    var endpoint: Requsetable { get set }
    var urlBuilder: URLBuildable { get set }
    var requestBuilder: RequestBuildable { get set }
    
    func executeRequest <APIResponse: Codable>(
        model: APIResponse.Type,
        body: [String: String]?
    ) -> AnyPublisher<APIResponse, APIError>

    func executeRequest <APIResponse: Codable>(
        fileName: String,
        fileData: Data,
        model: APIResponse.Type
    )  ->  AnyPublisher<APIResponse,APIError>
}
