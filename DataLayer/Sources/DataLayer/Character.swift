//
//  File.swift
//
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation

public struct Character: Codable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var gender: String
    public var image: URL
}

public struct DataWithPagination: Codable {
    public var results: [Character]
}
