//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Begench on 21.04.2025.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    AnimalGridItemView(animal: animals[0])
}
