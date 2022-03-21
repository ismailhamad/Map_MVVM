//
//  LocationViewModel.swift
//  Map
//
//  Created by hicham on 16/03/2022.
//

import Foundation
import MapKit
import SwiftUI
class LocationsViewModel: ObservableObject {
    //All loaded location
    @Published var location:[Location] = []
    
    // Current location on map
    @Published var maplocation:Location {
        didSet{
            updateMapRegion(location: maplocation)
        }
    }

    @Published var mapRegion:MKCoordinateRegion=MKCoordinateRegion()
    
    @Published var ShowLocationList:Bool=false
    
    @Published var ShowSheet:Location?=nil
    
    init(){
        let location = LocationsDataService.locations
        self.location=location
        self.maplocation = location.first!
        self.updateMapRegion(location: location.first!)
    }
    
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut) {
            mapRegion=MKCoordinateRegion(
                center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
     
    }
 func toggleLocationList(){
        withAnimation(.easeInOut){
            ShowLocationList.toggle()
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation (.easeInOut){
            maplocation = location
        }
      
    }
    
    func nextButtonPressed() {
        
        guard let currentIndex=location.firstIndex(where: {$0 == maplocation}) else{
            print("could not find current index in location array!")
            return
        }
        
        let nextIndex = currentIndex+1
        
        guard location.indices.contains(nextIndex)else{
            guard let firstLocation = location.first else{return}
            showNextLocation(location: firstLocation)
            return
        }
        let nextLocation = location[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    
    
  
}
