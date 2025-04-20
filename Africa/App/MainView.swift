//
//  MainView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Browse", systemImage: "square.grid.2x2"){
                ContentView()
            }
            Tab("Watch", systemImage: "play.rectangle"){
                VideoListView()
            }
            Tab("Locations", systemImage: "map"){
                MapView()
            }
            Tab("Gallerty", systemImage: "photo"){
                GalleryView()
            }
        }
    }
}

#Preview {
    MainView()
}
