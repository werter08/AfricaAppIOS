//
//  InsetLinkView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct InsetLinkView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "google.com")!)
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

struct InsetLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        InsetLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
      
    }
}
