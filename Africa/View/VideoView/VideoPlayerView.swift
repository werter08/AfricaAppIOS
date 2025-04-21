//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let video: VideoModel
    
    var body: some View {
        VStack {
            VideoPlayer(player: VideoHelper.play(fileName: video.id, fileType: "mp4"))
            
          
               
        }
        .foregroundStyle(.accent)
        .navigationTitle(video.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                   //
                }) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                }

            }
        })
    }
}

#Preview {
    NavigationStack {
        VideoPlayerView(video: VideoModel(id: "lion", name: "Lion", headline: ""))
    }
}
