//
//  ContentView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium )
    
    @State private var isGridViewActive = false
    
    @State private var gridColums = 1
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func switchGrid() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColums = gridLayout.count
        
        switch gridColums {
        case 1: toolbarIcon = "square.grid.2x2"
        case 2: toolbarIcon = "square.grid.3x2"
        case 3: toolbarIcon = "rectangle.grid.1x2"
        default: toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        
        NavigationView {
             
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(
                                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                            )
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: {AnimalDetailView(animal: animal)} ) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        //LISTVIEW
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                         
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.primary : Color.accent)
                        }
                        
                        //GRIDVIEW
                        Button(action: {
                            isGridViewActive = true
                            switchGrid()
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accent : Color.primary)
                        }
                    }
                }
            }
            .navigationTitle("Africa")
        }
    }
    
    func listView() {
        
    }
    
}

#Preview {
    ContentView()
}
