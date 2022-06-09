//
//  File.swift
//
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation

fileprivate struct Constants {
    static let baseURL = "rickandmortyapi.com"
    static let https = "https"
    static var characters: String {
        return "/api/character"
    }
}

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]
    
    var url: URL? {
        var componentURL = URLComponents()
        componentURL.scheme = Constants.https
        componentURL.host = Constants.baseURL
        componentURL.path = path
        componentURL.queryItems = queryItems
        
        return componentURL.url
    }
}

// Characters
extension Endpoint {
    static func getCharactersEndpoint() -> Endpoint {
        return Endpoint(path: Constants.characters, queryItems: [
            URLQueryItem(name: "page", value: "1")
        ])
    }
}
