//
//  File.swift
//  
//
//  Created by mohamed sliem on 26/03/2024.
//

import Foundation

public enum APIError: Error, Equatable {
    case requestFailed
    case decodingFailed
    case customError(statusCode: Int)
}

extension APIError {
  public var description: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .decodingFailed:
            return "Decoding Failed"
        case .customError(let statusCode):
            return "Status Code Error \(statusCode)"
        }
    }
}
