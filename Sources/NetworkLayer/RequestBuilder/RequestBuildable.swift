//
//  File.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

protocol RequestBuildable {
    func buildRequest(with url: URL) -> URLRequest?

    func buildRequestWithBody(with url: URL, httpBody: Data?) -> URLRequest?

    func buildMultipartRequest(
        with url: URL,
        filename: String,
        filedata: Data?,
        mimeType: String
    ) throws -> URLRequest?
}
