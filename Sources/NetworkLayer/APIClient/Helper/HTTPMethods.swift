//
//  HTTPMethods.swift
//
//
//  Created by mohamed sliem on 17/03/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
}

extension HTTPMethod {
    var hasBody: Bool {
        switch self {
            case .get , .head :
                return false
            default:
                return true
        }
    }
}
