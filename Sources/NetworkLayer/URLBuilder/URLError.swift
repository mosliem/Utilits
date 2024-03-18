//
//  URLError.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation


enum URLError: String {
    case schemaError
    case DomainError
    case pathError
}

extension URLError {
    
    var description: String {
        switch self {
            
        case .schemaError:
            return "URL schema is not valid"
        case .DomainError:
            return "URL domain is not valid"
        case .pathError:
            return "URL path is not valid"
        }
    }
}
