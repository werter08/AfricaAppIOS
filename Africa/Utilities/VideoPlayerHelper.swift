//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import Foundation
import AVKit

enum VideoHelper {
    static func play(fileName: String, fileType: String) -> AVPlayer?{
                
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            return nil
        }
        let videoPleyer = AVPlayer(url: url)
        videoPleyer.play()
        return videoPleyer
    }
}
