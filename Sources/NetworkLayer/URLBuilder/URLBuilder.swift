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
    private var urlValidator: Validator
    
    init(schema: String, host: String, path: String, queryItems: [String : String], validator: Validator = URLValidator()) {
        self.schema = schema
        self.host = host
        self.path = path
        self.queryItems = queryItems
        self.urlValidator = validator
    }
    
    public func build() throws -> URL? {
        var url: URL?
        
        do {
            let hostURL = try buildHostURL()
            let fullURL = try buildUrl(with: hostURL , relative: path)
            url = include(queryParamters: queryItems, with: fullURL)
        }
        catch {
            throw error as? URLError ?? error
        }
        return url
    }
    
    private func buildHostURL() throws -> String {
        let hostString = schema + "://" + host
        
        guard urlValidator.validate(host: hostString) else {
            throw URLError.hostError
        }
        
        return hostString
    }
    
    private func buildUrl(with path: String, relative host: String) throws -> URL {
        guard let url = URL(string: host) else {
            throw URLError.hostError
        }
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
