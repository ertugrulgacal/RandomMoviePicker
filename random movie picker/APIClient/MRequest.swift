//
//  MRequest.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 13.03.2023.
//

import Foundation

final class MRequest {
    // API Constants
    private struct Constants {
        static let baseURL = "https://api.themoviedb.org/3/"
    }
    // URL Components
    private let endpoint: MEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseURL
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    // API URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    // HTTP Method
    public let httpMethod = "GET"
    
    // Construct request
    public init(endpoint: MEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

let api_key = ReadJson().api_key

extension MRequest {
    static let listTopRatedRequest = MRequest(endpoint: .movie, pathComponents: ["top_rated"], queryParameters: [URLQueryItem(name: "api_key", value: api_key)])
}
