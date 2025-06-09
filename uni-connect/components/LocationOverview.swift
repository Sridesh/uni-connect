//
//  LocationOverview.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

import SwiftUI

struct DateType : Identifiable {
    let id = UUID()
    let name: String
    let time: String
}

struct LocationOverview: View {
    @State private var shown = true
    @State private var selected = 0
    @State private var open = false
    
    let options = ["Overview", "Navigation", "Crowd", "Services"]
    
    let openDates:[DateType] = [
        DateType(name:"Monday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Tuesday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Wednesday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Thursday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Friday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Monday",
                 time:"8.00am - 4.30pm"),
        DateType(name:"Monday",
                 time:"8.00am - 4.30pm"),
    ]
    
    
    var body: some View {
        VStack{
            Text("A spacious and well-equipped auditorium located within the campus, used for academic lectures, seminars, cultural programs, and official events. Features comfortable seating, advanced audio-visual systems, and a stage suitable for performances and presentations.")
            
            
            DisclosureGroup("Open dates", isExpanded: $open){
                ScrollView{
                    VStack{
                        ForEach(openDates){
                            data in
                            HStack{
                                Text(data.name)
                                Spacer()
                                Text(data.time).foregroundColor(.secondary)
                            }
                            Divider()
                        }
                    }
                }
            }
            .padding(.leading,15)
            .padding(.trailing,15)
            
            
            
            VStack(alignment: .leading){
                Text("Images")
                HStack{
                    Image("hall1")
                        .resizable()
                        .frame(width:100, height:100)
                        .clipped()
                    Image("hall1")
                        .resizable()
                        .frame(width:100, height:100)
                        .clipped()
                    Image("hall1")
                        .resizable()
                        .frame(width:100, height:100)
                        .clipped()
                }
            }.padding(.top,15)
        }
    }
}

#Preview {
    LocationDetails()
}
