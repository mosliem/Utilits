//
//  URLBuilder.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class URLBuilder {
    
    private var schema: String
    private var domain: String
    private var path: String
    private var queryItems: [String: String]
    
    init(schema: String, domain: String, path: String, queryItems: [String : String]) {
        self.schema = schema
        self.domain = domain
        self.path = path
        self.queryItems = queryItems
    }
    
    public func build() throws {
        
    }
    
    
    
    //MARK: - Validation of URL strings
    
}
