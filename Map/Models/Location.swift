//
//  Location.swift
//  Map
//
//  Created by hicham on 16/03/2022.
//

import Foundation
import MapKit
struct Location:Identifiable, Equatable{

    let id:UUID=UUID()
    let name:String
    let cityName:String
    let coordinates:CLLocationCoordinate2D
    let description:String
    let imageNames:[String]
    let link:String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id==rhs.id
    }

}

