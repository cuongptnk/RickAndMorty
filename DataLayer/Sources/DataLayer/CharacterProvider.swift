//
//  CharacterProvider.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation

public protocol CharactersProviderInterface {
    func fetchCharacters() async -> Result<[Character], NetworkError>
}

public class CharactersProvider: CharactersProviderInterface {
    private let apiProvider: APIProviderInterface
    
    public init(apiProvider: APIProviderInterface = DataService.shared) {
        self.apiProvider = apiProvider
    }
    
    // TODO: write a test for this by write a Mock
    // one for happy path and one for fail path
    public func fetchCharacters() async -> Result<[Character], NetworkError>{
        return await apiProvider.fetchCharacters()
    }
}
