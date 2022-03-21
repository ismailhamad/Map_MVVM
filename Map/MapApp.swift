//
//  MapApp.swift
//  Map
//
//  Created by hicham on 16/03/2022.
//

import SwiftUI

@main
struct MapApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(vm)
        }
    }
}
