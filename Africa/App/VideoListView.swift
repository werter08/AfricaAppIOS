//
//  VideoListView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            })
            .navigationTitle("Videos")
        }
    }
}

#Preview {
    VideoListView()
}
