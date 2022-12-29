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
  
  // current locations on map
  @Published  var mapLocation : Location {
    didSet{
      updatemapRegion(location:mapLocation)
    }
  }
  
  // current mapRegion
    @Published  var mapRegion = MKCoordinateRegion()
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
  
  // show list of location
  @Published  var showLoctionsList = false

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
  
   func toggoleLcationList(){
    withAnimation(.easeInOut){
      showLoctionsList.toggle()
    }
  }
  
  func showNextLocation(location: Location){
    withAnimation(.easeInOut){
      mapLocation = location
      showLoctionsList = false
    }
  }
  
  func nextButtonPressed() {
       // Get the current index
       guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
           print("Could not find current index in locations array! Should never happen.")
           return
       }
       
       // Check if the currentIndex is valid
       let nextIndex = currentIndex + 1
       guard locations.indices.contains(nextIndex) else {
           // Next index is NOT valid
           // Restart from 0
           guard let firstLocation = locations.first else { return }
           showNextLocation(location: firstLocation)
           return
       }
       
       // Next index IS valid
       let nextLocation = locations[nextIndex]
       showNextLocation(location: nextLocation)
   }
}

