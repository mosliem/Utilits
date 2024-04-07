//
//  MultiPartRequest.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class MultiPartRequest: MultiPartRequsetable {
    
    var boundary: String?
    var boundaryPostfix: String?
    var boundaryPrefix: String?
    
    var fileData: Data
    var filename: String
    var mimeType: String
    var requestBody: Data?
    var url: URL
    
    var httpMehtod: HTTPMethod
    var networkType: URLRequest.NetworkServiceType?
    var headers: [String : String]?
    var httpBody: Data?
    var timeoutInterval: TimeInterval?
    
    var request: URLRequest?
    
    init(
        fileData: Data, filename: String,
        mimeType: String, url: URL, httpMehtod: HTTPMethod,
        networkType: URLRequest.NetworkServiceType?,
        headers: [String : String]?,
        timeoutInterval: TimeInterval?
    ) {
        self.fileData = fileData
        self.filename = filename
        self.mimeType = mimeType
        self.url = url
        self.httpMehtod = httpMehtod
        self.networkType = networkType
        self.headers = headers
        self.timeoutInterval = timeoutInterval
    }
    
}
