//
//  LocationsView.swift
//  Map
//
//  Created by hicham on 16/03/2022.
//

import SwiftUI
import MapKit
struct LocationsView: View {
    //@StateObject var vm = LocationsViewModel()
    @EnvironmentObject private var vm :LocationsViewModel

    var body: some View {
        ZStack {
            mapLayer
            VStack(spacing:0){
               header
                .padding()
                 Spacer()
                
                ZStack{
                    ForEach(vm.location){ location in
                        if vm.maplocation == location {
                            
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
        .sheet(item: $vm.ShowSheet, onDismiss:nil) { location in
            LocationDetailView(locations: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header:some View{
        VStack {
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.maplocation.name+", "+vm.maplocation.cityName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height:55)
                    .animation(.none, value: vm.maplocation)
                    .overlay(alignment:.leading) {
                        Image(systemName:"arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.ShowLocationList ? 180 : 0))
                            
                    }
            }

            if vm.ShowLocationList {
                LocationListView()
            }
           
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer:some View{
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.location, annotationContent: { location  in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotionView().scaleEffect(vm.maplocation==location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                }
            }
        }).ignoresSafeArea()
    }
}
