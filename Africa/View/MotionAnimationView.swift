//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Begench on 21.04.2025.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircles = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    func randomCordinate(max: CGFloat) -> CGFloat { CGFloat.random(in: 0...max) }
    func randomSize() -> CGFloat { CGFloat(Int.random(in: 10...300)) }
    func randomScale() -> CGFloat { CGFloat(Double.random(in: 0.1...2.0)) }
    func randomSpeed() -> Double { Double.random(in: 0.25...1) }
    func randomDelay() -> Double { Double.random(in: 0...2) }
   

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircles, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCordinate(max: geometry.size.width),
                                  y: randomCordinate(max:  geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(perform: { isAnimating = true })
                }
            }//-ZStack
            .drawingGroup()
        }
    }
}

#Preview {
    MotionAnimationView()
}
