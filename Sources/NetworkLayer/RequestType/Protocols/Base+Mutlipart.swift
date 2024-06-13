//
//  Base+Mutlipart.swift
//
//
//  Created by mohamed sliem on 19/03/2024.
//

import Foundation

public enum MultiPartFormDataType {
    case text
    case file
}

protocol MultiPartRequsetable: BaseRequestable {
    var boundary: String { get set }
    var boundaryPostfix: String? { get set }
    var boundaryPrefix: String? { get set }
   
    var fileData: Data? { get set }
    var filename: String? { get set }
    var mimeType: String? { get set }

    var requestBody: Data? { get set }
    
    func handleFileName()
    func buildBoundary()
    func buildBoundaryPrefix()
    func buildBoundaryPostfix()
    func setMultipartHeader()
}

extension MultiPartRequsetable {
    func buildBoundary(){
        boundary = "Boundary-\(UUID().uuidString)"
    }
    
    func handleFileName(){
        filename = "\(filename)_\(Date().description)."
    }
    
    func buildBoundaryPrefix(){
        boundaryPrefix = "--\(String(describing: boundary))\r\n"
    }
    
    func buildBoundaryPostfix(){
        boundaryPostfix = "--\(String(describing: boundary))--"
    }
    
    func setMultipartHeader(){
        request?.setValue("multipart/form-data; boundary=\(String(describing: boundary))", forHTTPHeaderField: "Content-Type")
    }
    
    func buildTextMultiBody(with key: String, value: Any) -> Data{
        var bodyString = ""
        bodyString += boundaryPrefix!
        bodyString += "Content-Disposition:form-data; name=\"\(key)\""
        bodyString += "\r\n\r\n\(value)\r\n"
        return bodyString.data(using: .utf8)!
    }
    
    func setFileMutliBody(filename: String? = nil, mime: String? = nil, fileData: Data) -> Data {
        var body: Data = .init()
        body.append(contentsOf: boundaryPrefix!.utf8)
        body.append(contentsOf: "Content-Disposition:form-data; name=\"file\"; filename=\(filename!)\r\n".utf8)
        body.append(contentsOf: "Content-Type: \(mime!)\r\n\r\n".utf8)
        body.append(fileData)
        body.append(contentsOf:"\r\n".utf8)
        body.append(contentsOf:"\r\n".utf8)
        print("set", String(data: body, encoding: .utf8), fileData)
        return body
    }
    
    func appendPostfixBoundry(){
        httpBody?.append(contentsOf: boundaryPostfix!.utf8)
    }

}
