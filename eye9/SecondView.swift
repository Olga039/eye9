//
//  SecondView.swift
//  eye9
//
//  Created by Olga on 2/5/24.
//

import SwiftUI
import MapKit

struct SecondView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    @State private var mapSelection: MKMapItem?
    
    var body: some View {
        NavigationView {
            Map(position: $cameraPosition, selection: $mapSelection) {
                
                
                Annotation("My location", coordinate: .userLocation) {
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.blue.opacity(0.25))
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundColor(.blue)
                    }
                }
                ForEach(results, id: \.self) {item in let placemark = item.placemark
                    Marker(placemark.name ?? "", coordinate: placemark.coordinate)
                }
                
            }
            .overlay(alignment: .top) {
                TextField("Search for a location...", text: $searchText)
                    .font(.subheadline)
                    .padding(12)
                    .background(.white)
                    .padding()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .onSubmit(of: .text) {
                //            print("Search for locations with query\(searchText)")
                Task { await searchPlaces()}
            }
            .onChange(of: mapSelection, {oldValue, newValue in
            })
            
            .mapControls {
                MapCompass()
                MapUserLocationButton()
                MapPitchToggle()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
    
    extension SecondView {
        func searchPlaces() async {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = searchText
            request.region = .userRegion
            let results = try? await MKLocalSearch(request: request).start()
            self.results = results?.mapItems ?? []
            
        }
    }
    
    extension CLLocationCoordinate2D {
        static var userLocation: CLLocationCoordinate2D {
            return .init(latitude: 25.7602, longitude: -80.1959)
        }
    }
    extension MKCoordinateRegion {
        static var userRegion: MKCoordinateRegion {
            return .init(center: .userLocation,
                         latitudinalMeters: 10000,
                         longitudinalMeters: 10000)
        }
    }
    


#Preview {
    SecondView()
}
