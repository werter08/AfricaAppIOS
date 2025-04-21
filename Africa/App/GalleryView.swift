//
//  GalleryView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct GalleryView: View {
    

    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium )
    
    @State private var selectedAnimal: String = "lion"
    @State var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.vertical)
                    .onChange(of: gridColumn) { _ in
                        gridSwitch()
                        
                    }
                
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.circle)
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptic.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .background(MotionAnimationView())
        .navigationTitle("Gallery")
        
    }
}

#Preview {
    GalleryView()
}
