//
//  InsetFactView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) {item in
                    Text(item)
          
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 146, idealHeight: 166, maxHeight: 180 )
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
      
    }
}
