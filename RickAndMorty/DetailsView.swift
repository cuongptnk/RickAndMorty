//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Wattpad Cuong on 2022-06-30.
//

import SwiftUI

struct DetailsView: View {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    
    var body: some View {
        VStack {
            Text("Name: " + name)
            Text("Status: " + status)
            Text("Species: " + species)
            Text("Gender: " + gender)
            AsyncImage(url: URL(string: image))
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(name: "Test Name", status: "status", species: "species", gender: "gender", image: "")
    }
}
