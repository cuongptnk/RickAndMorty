//
//  CharacterProvider.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation
import DataLayer

protocol CharactersProviderInterface {
    func fetchCharacters() async -> Result<[Character], NetworkError>
}

public class CharactersProvider: CharactersProviderInterface {
    private let apiProvider: APIProviderInterface
    
    init() {
        self.apiProvider = DataService.shared
    }
    
    func fetchCharacters() async -> Result<[Character], NetworkError>{
        return await apiProvider.fetchCharacters()
    }
}
