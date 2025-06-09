//
//  Services.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

struct ServicesType : Identifiable{
    let id = UUID()
    let title:String
    let icon:String
}

let serviceData : [ServicesType] = [
    ServicesType(title:"Lecture Conducting", icon:"graduationcap"),
    ServicesType(title:"Hosting Seminars", icon:"music.microphone"),
    ServicesType(title:"Examination Hosting", icon:"newspaper"),
    ServicesType(title: "Event Hosting", icon: "balloon")
]

import SwiftUI

struct Services: View {
    var body:some View{
        Section(){
            VStack(alignment: .leading){
              Text("Services").font(.headline)
                ForEach(serviceData){
                    item in
                    HStack{
                        Image(systemName: item.icon).foregroundColor(.blue).frame(width: 50)
                        Text(item.title)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                    Divider()
                }
            }
        }.padding()
        
        Section(){
            VStack(alignment: .leading){
              Text("Facilities").font(.headline)
                ForEach(serviceData){
                    item in
                    HStack{
                        Image(systemName: item.icon).foregroundColor(.green)
                        Text(item.title)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                    Divider()
                }
            }
        }.padding()
        
    }
}

#Preview{
    LocationDetails()
}
