//
//  VideoListItem.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct VideoListItemView: View {
    
    let video: VideoModel
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ZStack {
                Image(video.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame( height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
              
            }
        }
    }
}


struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
        let videos: [VideoModel] = Bundle.main.decode("videos.json")
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
