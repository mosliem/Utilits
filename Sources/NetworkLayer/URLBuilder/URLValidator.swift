//
//  URLValidator.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class URLValidator {
    
    static let shared = URLValidator()
    
    private let schemas = ["http","https"]
    init() {}
    
    public func validate(_ schema: String) -> Bool{
        guard schemas.contains(schema) else {
            return false
        }
        
        return true
    }
    
    public func validate(host: String) -> Bool {
        let detector = try? NSDataDetector(types:  NSTextCheckingResult.CheckingType.link.rawValue)
        let match = detector?.firstMatch(in: host, range: NSRange(location: 0, length: host.utf16.count))
        
        guard match?.range.length == host.utf16.count else {
            return false
        }
        
        return true
    }
}
