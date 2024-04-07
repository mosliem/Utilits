//
//  Base+Mutlipart.swift
//
//
//  Created by mohamed sliem on 19/03/2024.
//

import Foundation

protocol MultiPartRequsetable: BaseRequestable {
    var boundary: String? { get set }
    var boundaryPostfix: String? { get set }
    var boundaryPrefix: String? { get set }
   
    var fileData: Data { get set }
    var filename: String { get set }
    var mimeType: String { get set }

    var requestBody: Data? { get set }
    
    func handleFileName()
    func buildBoundary()
    func buildBoundaryPrefix()
    func buildBoundaryPostfix()
    func setMultipartHeader()
    func buildBody()
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
    
    func buildBody(){
        httpBody = Data()
        httpBody?.append(contentsOf: boundaryPrefix!.utf8)
        httpBody?.append(contentsOf: "Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".utf8)
        httpBody?.append(contentsOf: "Content-Type: \(mimeType)\r\n\r\n".utf8)
        httpBody?.append(fileData)
        httpBody?.append(contentsOf:"\r\n".utf8)
        httpBody?.append(contentsOf: boundaryPostfix!.utf8)
        httpBody?.append(contentsOf:"\r\n".utf8)
    }

}
