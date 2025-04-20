//
//  InsetMapView.swift
//  Africa
//
//  Created by Begench on 20.04.2025.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.100286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
     
    var body: some View {

        Map(coordinateRegion: $region)
            .overlay(alignment: .topTrailing) {
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        Text("Locations")
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                          
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
       
                }
                .padding(12)
                
                
            }
            .frame(height: 256)
            .cornerRadius(12)
            
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [AnimalModel] = Bundle.main.decode("animals.json")
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
      
    }
}
