//
//  LocationPreviewView.swift
//  MapAppSwiftUI
//
//  Created by Abdallah on 29/12/2022.
//

import SwiftUI

struct LocationPreviewView: View {
  
  let location : Location

    var body: some View {
      HStack(alignment: .bottom, spacing: 0) {
        VStack(alignment:.leading,spacing: 16){
          imageSection
          titleSection
        }
          VStack( spacing: 8.0){
            learnMoreButtton
            nextButton
          }
        }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius:  10.0)
            .fill(.ultraThinMaterial)
            .offset(y:65)
      )
      .cornerRadius(10)
      }
    }


struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack{
        Color.purple.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
          .padding()
      }
    }
}

extension LocationPreviewView{
  
  private var  imageSection : some View{
    ZStack{
      if let imageName = location.imageNames.first{
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 100,height: 100)
          .cornerRadius(10)
      }
    }
    .padding(6)
    .background(Color.white)
    .cornerRadius(10)
  }
  private var  titleSection : some View{
    
    VStack(alignment: .leading, spacing: 4.0){
      Text(location.name)
        .font(.title2)
        .fontWeight(.bold)
      Text(location.cityName)
        .font(.subheadline)
    }
    .frame(maxWidth: .infinity,alignment: .leading)
  }
  
  private var  learnMoreButtton : some View{
    Button {
      
    } label: {
      Text("Learn more")
        .font(.title2)
        .frame(width: 125 ,height: 35)
    }
    .buttonStyle(.borderedProminent )
  }
  
  private var  nextButton : some View{
    Button {
      
    } label: {
      Text("Next")
        .font(.title2)
        .frame(width: 125 ,height: 35)
    }
    .buttonStyle(.bordered )
  }
}
