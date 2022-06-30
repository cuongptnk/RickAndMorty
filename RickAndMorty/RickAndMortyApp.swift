//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import SwiftUI
import DataLayer

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CharacterListViewModel(characterProvider: CharactersProvider()))
        }
    }
}
