//
//  File.swift
//  
//
//  Created by mohamed sliem on 21/03/2024.
//

import Foundation

enum RequestBuilderError: Error {
    case noMultipartDataFound
}

extension RequestBuilderError {
    var description: String {
        switch self{
            
        case .noMultipartDataFound:
            "No Multipart data found, or data is corrupted!"
        }
    }
}
