//
//  MapAnatation.swift
//  Africa
//
//  Created by Begench on 21.04.2025.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var cicleDuration: Double = 2.0
    
    @State private var animation: Double = 0.0
    
    var location: LocationModel
    
    var body: some View {
        ZStack {
            Circle()
                .scaledToFit()
                .frame(width: 52, height: 52, alignment: .center)
                .foregroundStyle(.accent)
            
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundStyle(.accent)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(.circle)
            
        }
        .onAppear(
            perform: {
                withAnimation(Animation.easeOut(
                    duration: cicleDuration).repeatForever(autoreverses: false)) { animation = 1.0 }
            }
         )
    }
}

struct MapAnatation_Previews: PreviewProvider {
    static var previews: some View {
        let location: [LocationModel] = Bundle.main.decode("locations.json")
        MapAnnotationView(location: location[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
