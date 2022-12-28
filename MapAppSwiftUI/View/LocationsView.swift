//
//  LocationsView.swift
//  MapAppSwiftUI
//
//  Created by Abdallah on 28/12/2022.
//

import SwiftUI
import MapKit
struct LocationsView: View {
  
  @EnvironmentObject private var vm : LocationsViewModel
  
    var body: some View {
      ZStack {
        Map(coordinateRegion: $vm.mapRegion)
          .ignoresSafeArea()
      }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
        .environmentObject(LocationsViewModel())
    }
}
