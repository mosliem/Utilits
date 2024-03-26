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
