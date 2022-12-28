//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Abdallah on 28/12/2022.
//

import SwiftUI
import Foundation
import MapKit

class LocationsViewModel : ObservableObject {
  
  // all loadef locations
  @Published var locations : [Location]
  
    @Published  var mapRegion = MKCoordinateRegion()
  
  // current locations on map
  @Published  var mapLocation : Location {
    didSet{
      updatemapRegion(location:mapLocation)

    }
  }

  let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
  init(){
    let locations = LocationsDataService.locations
    self.locations = locations
    self.mapLocation = locations.first!
    
    updatemapRegion(location:locations.first!)
  }
  
 private func updatemapRegion(location: Location){
   
   withAnimation(.easeInOut){
     mapRegion = MKCoordinateRegion(
       center: location.coordinates ,
       span: mapSpan)
   }
 
  }
}

