//
//  LocationPreviewView.swift
//  Map
//
//  Created by hicham on 17/03/2022.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location:Location
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing:16.0){
                imageSecation
                titleSecation
             
            }
            VStack(spacing: 8.0){
                leranMoreButton
                nextButton
        }
            
            
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThinMaterial)
                        .offset(y:65)
                        .cornerRadius(10))
        .padding()
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!).environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageSecation:some View{
        ZStack{
            if let imagename = location.imageNames.first{
                Image(imagename)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSecation:some View{
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
    }
    
    private var leranMoreButton:some View{
        Button {
            vm.ShowSheet = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        

    
    }
     
    
    private var nextButton:some View{
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)

    }
}
