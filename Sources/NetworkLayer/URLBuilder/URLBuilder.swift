//
//  URLBuilder.swift
//
//
//  Created by mohamed sliem on 18/03/2024.
//

import Foundation

class URLBuilder: URLBuildable {
    
    private var schema: String = ""
    private var host: String = ""
    private var path: String = ""
    private var queryItems: [String: Any] = [:]
    private var port: Int? 
    
    private var urlValidator: Validator
    private var endpoint: Requsetable
    //MARK: -  URL Components
    //parsing url components to assign queries and port number to URL 
    private var urlComponents: URLComponents?
    
    init(endpoint: Requsetable, validator: Validator) {
        self.urlValidator = validator
        self.endpoint = endpoint
        extract()
    }
    
    private func extract(){
        self.schema = endpoint.schema
        self.host = endpoint.host
        self.path = endpoint.path
        self.queryItems = endpoint.queryParameters
        self.port = endpoint.port
    }
    
    public func build() throws -> URL {
        
        do {
            let hostURL = try buildHostURL()
            let fullURL = try buildUrl(with: hostURL , relative: path)
            include(queryParamters: queryItems, with: fullURL)
        }
        catch {
            throw error as? URLError ?? error
        }
        
        //Assigning port number if it existed
        if let port = port {
            setURL(portNumber: port)
        }
        
        guard let url = urlComponents?.url else {
            throw URLError.urlComponentError
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
    
    private func initURLCompentents(with url: URL){
        urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    }
    
    @discardableResult
    private func include(queryParamters: [String: Any], with url: URL) -> URL? {
        guard !queryParamters.isEmpty else {
            return nil
        }
        
        var urlQueries = [URLQueryItem]()
        for query in queryParamters {
            let item = URLQueryItem(name: query.key, value: String(describing: query.value))
            urlQueries.append(item)
        }
        
        urlComponents?.queryItems = urlQueries
        return urlComponents?.url
    }
    
    private func setURL(portNumber: Int) {
        urlComponents?.port = portNumber
    }
}
