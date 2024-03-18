//
//  URLError.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation


enum URLError: Error {
    case schemaError
    case hostError
}

extension URLError {
    
    var description: String {
        switch self {
            
        case .schemaError:
            return "URL schema is not valid"
        case .hostError:
            return "URL domain is not valid"
        }
    }
}
