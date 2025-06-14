//
//  LocationNavigation.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

import SwiftUI

struct Instructions : Identifiable{
    let id = UUID()
    let main:String
    let sub:String
    let icon:String
}

var navigations : [Instructions] = [
    
    Instructions(main:"Take a left turn",sub:"",icon:"arrow.turn.up.left"),
    Instructions(main:"Take another left turn and reach the study area",sub:"Door near the vending machine",icon:"arrow.turn.up.left"),
    Instructions(main:"Take a left turn and exit from the other door",sub:"",icon:"arrow.turn.up.right"),
    Instructions(main:"Walk straight to the first door on yourarrow.up left",sub:"There will be a door with the name of 'Auditorium' on it",icon:"arrow.up"),
]

let floors = [
    "Ground floor",
    "First floor",
    "Second floor",
    "Third floor"
]

struct LocationNavigation: View {
    @State private var selectedFloor = ""
    @State private var imageOpen = false
    
    var onOtherFloor: Instructions {
        selectedFloor != "Second floor" ?
            Instructions(main: "Take the elevator or the stairs and go to 2nd floor", sub: "Both lead to same location", icon: "decrease.quotelevel") :
            Instructions(main: "Go near the elevator", sub: "Do not get in the elevator", icon: "decrease.quotelevel")
    }
    
    var finalArr : [Instructions] {
        [onOtherFloor] + navigations
    }
    
    var body :some View {
        VStack{
            
            CustomDropDown(selectedOption: $selectedFloor, options: floors, icon:"stairs", title: "Select the floor you are in")
                .padding(.bottom, 20)
            
            if !selectedFloor.isEmpty{
                VStack(alignment:.leading){
                    Text("Steps").font(.headline).foregroundColor(.secondary)
                    ForEach(finalArr){
                        item in
                        HStack(alignment: .center){
                            Image(systemName: item.icon).frame(width:50)
                            VStack(alignment:.leading){
                                Text(item.main)
                                if !item.sub.isEmpty {
                                    HStack{
                                        Image(systemName: "info.circle.fill").foregroundColor(.blue)
                                        
                                        Text(item.sub).font(.subheadline).foregroundColor(.secondary)
                                    }
                                }
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            Image("mac")
                                .resizable()
                                .frame(width: 50, height:50)
                                .onTapGesture {
                                    imageOpen = true
                                }
                                .sheet(isPresented: $imageOpen){
                                    VStack{
                                        Image("mac")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                    }
                                }
                            
                        }
                        Divider()
                    }
                }.frame(maxWidth: .infinity, alignment:.leading)
            }
        }.padding()
    }
}


#Preview {
    LocationDetails()
}
