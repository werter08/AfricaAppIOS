//
//  videoModel.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var coverImage: String {
        return "video-\(id)"
    }
}
