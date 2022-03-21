//
//  LocationMapAnnotionView.swift
//  Map
//
//  Created by hicham on 17/03/2022.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0.0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-4)
            
        }
    }
}

struct LocationMapAnnotionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotionView()
    }
}
