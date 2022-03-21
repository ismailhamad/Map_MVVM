//
//  LocationListView.swift
//  Map
//
//  Created by hicham on 17/03/2022.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var vm:LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.location) {location in
                Button {
                    vm.showNextLocation(location: location)
                    vm.toggleLocationList()
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
                
                
            }
        }
        .listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView().environmentObject(LocationsViewModel())
    }
}

extension LocationListView {
    private func listRowView(location:Location) -> some View{
        HStack{
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth:.infinity ,alignment:.leading)
            
        }
    }
}
