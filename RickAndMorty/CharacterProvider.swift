//
//  CharacterProvider.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation
import DataLayer

protocol CharactersProviderInterface {
    func fetchCharacters() async
}

public class CharactersProvider: CharactersProviderInterface {
    private let apiProvider: APIProviderInterface
    
    init() {
        self.apiProvider = DataService.shared
    }
    
    func fetchCharacters() async {
        return await apiProvider.fetchCharacters()
    }
}
