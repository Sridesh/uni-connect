//
//  CrowdLevel.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

import SwiftUI
import Charts

struct Crowd: Identifiable{
    let id = UUID()
    let day:String
    let crowdLevel:Int
}

struct LineData : Identifiable {
    var id = UUID()
    var time: String
    var level: Int
    var location: String

}

let data: [Crowd] = [
    Crowd(day: "Mon", crowdLevel: 40),
    Crowd(day: "Tue", crowdLevel: 35),
    Crowd(day: "Wed", crowdLevel: 22),
    Crowd(day: "Thu", crowdLevel: 22),
    Crowd(day: "Fri", crowdLevel: 44),
    Crowd(day: "Sat", crowdLevel: 60),
    Crowd(day: "Sun", crowdLevel: 63),
]

let lineChartData: [LineData] = [
    LineData(time: "8.00am", level: 30, location: "Station A"),
    LineData(time: "10.00am", level: 40, location: "Station A"),
    LineData(time: "12.00pm", level: 35, location: "Station A"),
    LineData(time: "2.00pm", level: 20, location: "Station A"),
    LineData(time: "4.00pm", level: 25, location: "Station A"),
]

let lineChartData2: [LineData] = [
    LineData(time: "8.00am", level: 20, location: "Station A"),
    LineData(time: "10.00am", level: 30, location: "Station A"),
    LineData(time: "12.00pm", level: 35, location: "Station A"),
    LineData(time: "2.00pm", level: 40, location: "Station A"),
    LineData(time: "4.00pm", level: 35, location: "Station A"),
]

let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

struct CrowdLevel: View {
    @State private var selectedDay = "Monday"
    
    var body: some View {
        VStack{
            VStack{
                Text("Highly Crowded").font(.title).foregroundColor(.red)
                Text("at the moment").font(.subheadline).foregroundColor(.red.opacity(0.8))
                
                Divider()
                
                HStack(){
                    Image(systemName: "calendar.badge.clock").foregroundColor(.secondary)
                        .padding(.trailing, 7)
                    
                    Text("Now").frame(maxWidth:.infinity, alignment: .leading).lineLimit(1).bold()
                    
                }.padding(5).frame(maxWidth: .infinity, alignment: .leading)
                Text("TSLE - COBSCCOMP24.1P").frame(maxWidth:.infinity, alignment: .leading).lineLimit(1)
                
                Divider()
                
                HStack{
                    Text("Full Capacity: ").font(.headline)
                    Text("250")
                }.padding(5).frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.05))
            .cornerRadius(15)
            
            
            
            VStack{
                Section(header: Text("Average crowd levels per day").font(.headline)){
                    //Crowd weekly chart
                    Chart(data){
                        item in
                        BarMark(x: .value("Day", item.day), y: .value("Average Crowd", item.crowdLevel))
                    }
                }.padding()
                
            }.border(Color.gray.opacity(0.3)).cornerRadius(15).padding()
            
            VStack{
                Section(header: Text("Crowd levels by time for each day").font(.headline)){
                    
                    Menu {
                                ForEach(days, id: \.self) { day in
                                    Button(day) {
                                        selectedDay = day
                                    }
                                }
                            }label: {
                                Label(selectedDay, systemImage: "calendar")
                                    .padding(10)
                                    .background(Color.blue.opacity(0.1))
                                    .cornerRadius(8)
                            }
                    
                    //Crowd per time chart
                    Chart {
                        ForEach(selectedDay == "Monday" ? lineChartData : lineChartData2) { item in
                            LineMark(
                                x: .value("Time", item.time),
                                y: .value("Crowd Level", item.level),
                                series: .value("Location", item.location)
                            )
                        }
                    }
                    .frame(height: 150)
                    .padding()

                }.padding()
                
            }.border(Color.gray.opacity(0.3)).cornerRadius(15).padding()
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    LocationDetails()
}
