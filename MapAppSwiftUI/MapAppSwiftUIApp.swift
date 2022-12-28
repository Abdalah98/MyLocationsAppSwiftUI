//
//  MapAppSwiftUIApp.swift
//  MapAppSwiftUI
//
//  Created by Abdallah on 28/12/2022.
//

import SwiftUI

@main
struct MapAppSwiftUIApp: App {
  
  @StateObject private var vm : LocationsViewModel = LocationsViewModel()

  
    var body: some Scene {
        WindowGroup {
          LocationsView().environmentObject(vm)
        }
    }
}
