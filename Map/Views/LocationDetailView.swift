//
//  LocationDetailView.swift
//  Map
//
//  Created by hicham on 17/03/2022.
//

import SwiftUI
import MapKit
struct LocationDetailView: View {
    @EnvironmentObject var vm:LocationsViewModel
    let locations:Location
    var body: some View {
    
            ScrollView{
                VStack{
                    imageSecation
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        titleSecation
                        Divider()
                        descriptionSecation
                        Divider()
                        mapLayer
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
             
                }
                
            }.ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(backButton,alignment:.topLeading)
        
        
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(locations: LocationsDataService.locations.first!).environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    private var imageSecation:some View{
        TabView{
            ForEach(locations.imageNames,id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height:500)
        .tabViewStyle(.page)
    }
    
    private var titleSecation:some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(locations.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(locations.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
            
        }
    }
    
    private var descriptionSecation:some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(locations.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url=URL(string: locations.link){
                Link("Read more on wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
           
        }
    }
    
    private var mapLayer:some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: locations.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))),
            annotationItems: [locations]){ location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotionView()
                    .shadow(radius: 10)
            }
            
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(20)
    }
    
    private var backButton:some View{
        Button {
            vm.ShowSheet=nil
        } label: {
            Image(systemName: "xmark")
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .padding()
        }

    }
}
