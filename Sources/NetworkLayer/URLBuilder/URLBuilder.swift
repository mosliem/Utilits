//
//  URLBuilder.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class URLBuilder {
    
    private var schema: String
    private var host: String
    private var path: String
    private var queryItems: [String: String]
    
    init(schema: String, host: String, path: String, queryItems: [String : String]) {
        self.schema = schema
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
    
    public func build() throws {
        do {
            let hostURL = try buildHostURL()
            let fullURL = try buildUrl(with: hostURL , relative: path)
        }
        catch {
            throw error as? URLError ?? error
        }
    }
    
    private func buildHostURL() throws -> String {
        let hostString = schema + "://" + host
        
        guard URLValidator.shared.validate(host: hostString) else {
            throw URLError.hostError
        }
        
        return hostString
    }
    
    private func buildUrl(with path: String, relative host: String) throws -> URL {
        guard let url = URL(string: host) else {
            throw URLError.hostError
        }
        var hostURL = url
        guard let fullURL = URL(string: path, relativeTo: url) else {
            throw URLError.hostError
        }
        return fullURL
    }
    
    private func include(queryParamters: [String: Any], with url: URL) -> URL? {
        guard !queryParamters.isEmpty else {
            return nil
        }
        
        var urlQueries = [URLQueryItem]()
        for query in queryParamters {
            let item = URLQueryItem(name: query.key, value: String(describing: query.value))
            urlQueries.append(item)
        }
        
        var urlCompentents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlCompentents?.queryItems = urlQueries
        return urlCompentents?.url
    }
    
}
