//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accent
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        
                }
                .padding(.horizontal)
                
                // МАР
                Group {
                    HeadingView(headingImage: "map", headingText: "National parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    InsetLinkView(animal: animal)
                        .padding(.bottom, 50)
                }
                .padding(.horizontal)
     
            }
        }
        .navigationTitle("Learn about \(animal.name)")
        .toolbarTitleDisplayMode(.inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
