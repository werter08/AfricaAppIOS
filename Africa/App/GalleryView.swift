//
//  GalleryView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        }
        .frame(width: .infinity, height: .infinity)
        .background(MotionAnimationView())
        .navigationTitle("Gallery")
        
    }
}

#Preview {
    GalleryView()
}
