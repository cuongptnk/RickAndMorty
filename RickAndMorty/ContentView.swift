//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-09.
//

import SwiftUI
import DataLayer

struct ContentView: View {
    @StateObject var viewModel: CharacterListViewModel

    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characterList, id: \.self, content: {
                    character in
                    NavigationLink(destination: DetailsView(
                        name: character.name,
                        status: character.status,
                        species: character.species,
                        gender: character.gender,
                        image: character.image.absoluteString)) {
                        HStack {
                            AsyncImage(url: URL(string: character.image.absoluteString)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 44, height: 44)
                                .background(Color.gray)
                                .clipShape(Circle())
                            

                            
                            Text(character.name)
                            
                        }
                    }
                })
            }.listStyle(GroupedListStyle())
                .navigationTitle("Home")
        }.task {
            await viewModel.getCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: CharacterListViewModel(characterProvider: CharactersProvider()))
    }
}
