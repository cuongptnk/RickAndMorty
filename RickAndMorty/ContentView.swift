//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import SwiftUI

struct ContentView: View {
    let charactersProvider: CharactersProviderInterface
    
    var body: some View {
        Text("Hello, world!")
            .padding().onAppear {
                Task {
                    await charactersProvider.fetchCharacters()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(charactersProvider: CharactersProvider())
    }
}
