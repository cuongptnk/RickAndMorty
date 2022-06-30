//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import Foundation
import DataLayer

class CharacterListViewModel: ObservableObject {
    @Published var characterList: [Character] = []
    private let characterProvider: CharactersProviderInterface
    
    init(characterProvider: CharactersProviderInterface) {
        self.characterProvider = characterProvider
    }
    
    
    func getCharacters() async {
        let result = await self.characterProvider.fetchCharacters()
        switch result {
        case .success(let characters):
            // or @MainActor for ios 15
            DispatchQueue.main.async {
                self.characterList = characters
            }
        case .failure(let error):
            print(error)
            // TODO: retry if error
        }
    }
}
