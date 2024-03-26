//
//  File.swift
//  
//
//  Created by mohamed sliem on 19/03/2024.
//

import Foundation
import Combine

class APIProvider {
    
   static let shared = APIProvider()
   private init() {}
    
    func executeRequest(request: URLRequest) async throws -> (Data, URLResponse){
        do {
            async let (data, response) = URLSession.shared.data(for: request)
            return try await (data, response)
        }
        catch{
            throw error
        }
    }
    
}
