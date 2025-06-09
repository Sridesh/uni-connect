//
//  SeatReservation.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

struct SeatReservation: View {
    @State private var facility = "Library"
    @State private var seat = ""
    @State private var fullday = false
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    var body: some View {
        NavigationStack{
            List{
                CustomDropDown(selectedOption: $facility, options: ["Library","Study Area", "Canteen", "Medical Room"], icon: "map", title: "Select a facility")
    
                CustomDropDown(selectedOption: $seat, options: ["A-1", "A-2","B-5"], icon: "square.split.2x2", title: "Select a seat")
                    
                Section(header: Text("Duration")) {
                    Toggle("Full day", isOn: $fullday).padding()
                    HStack(spacing: 70){
                        DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute).datePickerStyle(.compact)
                        
                        DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute).datePickerStyle(.compact)
                    }.padding()
                }
                
                Section(header: Text("Map")) {
                    VStack(){}.padding()
                }
                
                Button("Confirm Reservation", action:{}).frame(maxWidth: .infinity)
            }
        }.navigationTitle("Seat Reservation")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SeatReservation()
}
