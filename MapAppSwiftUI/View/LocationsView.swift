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
          mapLayer
          .ignoresSafeArea()
      
        VStack (spacing: 0){
           header
            .padding()
          Spacer()
          locationStackPreviewStack
        
        }
      }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
        .environmentObject(LocationsViewModel())
    }
}

extension LocationsView{
  private var header : some View{
    VStack{
      Button(action: vm.toggoleLcationList) {
        Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
          .font(.title2)
          .fontWeight(.black)
          .foregroundColor(.primary)
          .frame(height: 50)
          .frame(maxWidth: .infinity)
          .animation(.none, value: vm.mapLocation)
          .overlay(alignment: .leading) {
            Image(systemName: "arrow.down")
              .font(.headline)
              .foregroundColor(.primary)
              .padding()
              .rotationEffect(Angle(degrees: vm.showLoctionsList ? 180 : 0 ))
          }
      }
      if vm.showLoctionsList{
        LocationsViewList()
      }
    }
    .background(.thickMaterial)
    .cornerRadius(10)
    .shadow(color: Color.black.opacity(0.3), radius: 20,x: 0, y: 15)
  }
  
  private var mapLayer : some View{
    
    Map(coordinateRegion:  $vm.mapRegion,
        annotationItems: vm.locations,
        annotationContent: { location in
      MapAnnotation(coordinate: location.coordinates) {
        LocationMapAnnotationView()
          .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
          .shadow(radius: 10)
          .onTapGesture {
            vm.showNextLocation(location: location)
          }
      }
    })
  }
  
  private var locationStackPreviewStack : some View{

  ZStack {
    ForEach(vm.locations){ location in
      if vm.mapLocation == location {
        LocationPreviewView(location: location)
          .shadow(color: Color.black.opacity(0.3),radius:20)
          .padding()
          .transition(.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)))
      }
    }
  }
}
  }
