//
//  PCReservation.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI



struct PCReservation: View {
    @State private var facility = "IOS Lab"
    @State private var seat = ""
    @State private var fullday = false
    @State private var startTime = Date()
    @State private var endTime = Date().addingTimeInterval(3600)
    @State private var showMap = false
    @State private var success = false
    @State private var error = false
    @State private var remove = false
    
    @Binding var reserved :Bool
    @Binding var open : Bool
    
    let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()

    
    var body: some View {
        NavigationStack{
            Text("Reserve a device here")
                .font(.title)
                .padding()
            
            
            
            List{
                
                if reserved{
                    Section{
                        Text("Your reservation")
                            .font(.title).bold()
                        
                        Text("Device: \(seat)")
                        Text("Time: \(timeFormat.string(from: startTime)) - \(fullday ? "4:30 PM" : timeFormat.string(from: endTime))")
                    }
                    VStack{
                        Button("Remove Reservation"){
                            remove = true
                        }
                    }
                    .alert("Remove reservation?", isPresented: $remove){
                        Button("Remove", role: .cancel){
                            reserved = false
                        }
                        Button("Cancel", role:.destructive){}
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack{
                        Button("Close" ,role:.destructive){
                            open = false
                        }
                    }.frame(maxWidth: .infinity)
                }
                else {
                    CustomDropDown(selectedOption: $seat, options: [
                        "PCLAB04 - 01",
                        "PCLAB04 - 04",
                        "PCLAB04 - 05",
                        "PCLAB04 - 07",
                        "PCLAB04 - 08",
                        "PCLAB04 - 09",
                        "PCLAB04 - 10",
                        "PCLAB04 - 12",
                    ], icon: "desktopcomputer", title: "Select a pc")
                    
                    Section(header:Text("Device Availability")){
                        VStack{
                            HStack{
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(.green.opacity(0.5))
                                Text("Available")
                                Spacer()
                                Text("8")
                                    .bold()
                            }
                            Divider()
                            HStack{Circle()
                                    .frame(width: 10)
                                    .foregroundColor(.red.opacity(0.5))
                                Text("Reserved")
                                Spacer()
                                Text("5")
                                    .bold()
                            }

                        }
                    }
                        
                    Section(header: Text("Duration")) {
                        VStack{
                            
                            Toggle("Full day", isOn: $fullday).padding()
                            Divider()
                            HStack(spacing: 70){
                                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute).datePickerStyle(.compact)
                                    .disabled(fullday)
                                
                                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute).datePickerStyle(.compact)
                                    .disabled(fullday)
                                
                            }.padding()
                        }
                    }
                    
                  
                    
                    Section(header: Text("Map")) {
                        VStack(alignment: .leading){
                            Button(action:{
                                showMap.toggle()
                                
                            }){
                                Text(showMap ? "Hide seatings":"Show seatings")
                                
                            }
                            if showMap {
                                Image("seatings")
                                    .frame(maxWidth:300)
                            }
                        }
                    }
                    
                    VStack{
                        Button("Confirm Reservation", action:{
                            success=true
                        })
                        .alert("Confirm?", isPresented: $success ) {
                            Button("OK", role: .cancel){
                                reserved = true
                            }
                            Button("Cancel", role:.destructive){}
                        } message: {
                            Text("Time: \(timeFormat.string(from: startTime)) - \(fullday ? "4:30 PM" : timeFormat.string(from: endTime))")
                        }
                    }.frame(maxWidth: .infinity).disabled(seat.isEmpty)
                    
                    VStack{
                        Button("Cancel" ,role:.destructive){
                            open = false
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }
        }.navigationTitle("PC Reservation")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PCReservation( reserved: .constant(false) , open : .constant(true))
}
