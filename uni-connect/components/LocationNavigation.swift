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

let navigations : [Instructions] = [
    Instructions(main:"Take the elevator or the stairs and go to 2nd floor", sub:"Both lead to smae location",icon:"decrease.quotelevel"),
    Instructions(main:"Take a left turn",sub:"",icon:"arrow.turn.up.left"),
    Instructions(main:"Take another left turn and reach the study area",sub:"Door near the vending machine",icon:"arrow.turn.up.left"),
    Instructions(main:"Take a left turn and exit from the other door",sub:"",icon:"arrow.turn.up.right"),
    Instructions(main:"Walk straight to the first door on yourarrow.up left",sub:"There will be a door with the name of 'Auditorium' on it",icon:"arrow.up"),
]

struct LocationNavigation: View {
    var body :some View {
        VStack{
            
            VStack(alignment:.leading){
                Text("Steps").font(.headline).foregroundColor(.secondary)
                ForEach(navigations){
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
                        }
                        
                            .frame(width:280, alignment: .leading)
                       
                        
                    }
                    Divider()
                }
                
            }.frame(maxWidth: .infinity, alignment:.leading)
        }.padding()
    }
}


#Preview {
    LocationDetails()
}
