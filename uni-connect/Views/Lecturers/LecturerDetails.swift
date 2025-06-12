//
//  LecturerDetails.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

let times = [
    "10.00 AM",
    "10.20 AM",
    "11.00 AM",
    "04.00 PM",
    "04.40 PM"
]

struct LecturerDetails:View {
    let name : String
    let image: String
    let desg: String
    let dayCon:String
    @Binding var dateSelected:Bool
    @State private var date = Date()
    @State private var active = false
    @State private var confirm = false
    @State private var time = ""
    @State private var confirmTime : [String] = []
    @State private var navActive = false
    
    var body: some View {

            
            
            VStack{
                
                VStack{
                    Image(image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(50)
                        .padding(.vertical,0)
                    
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                        .bold()
                    
                    
                    Text(desg)
                        .foregroundColor(.secondary)
                    
                    HStack{
                        Text("Slots Avilable")
                            .foregroundColor(.secondary)
                        
                        Circle()
                            .frame(width: 10)
                            .foregroundColor(.green.opacity(0.5))
                    }
                    
                    HStack{
                        Image(systemName: "envelope").foregroundColor(.blue)
                        Image(systemName: "phone").foregroundColor(.blue)
                        Image(systemName: "ellipsis.message").foregroundColor(.blue)
                    }.padding(.top,5)
                    
                }.padding()
                
                VStack{
                    Text("Please note that a time slot it is only 20 minutes. If you wish to take more time than that, please reserve consecutive time slots according to your requirements")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.gray)
                }
                
                if dateSelected  {
                    Text("You are booking a time for \(dayCon)").padding(.top)
                    
                    ScrollView{
                        ForEach(times, id: \.self){
                            item in
                            if !confirmTime.contains(item) {
                                HStack{
                                    Text(item)
                                    Spacer()
                                    Button("",systemImage: "chevron.right")
                                    {
                                        time = item
                                        confirm = true
                                    }
                                        .foregroundColor(.secondary)
                                        .padding()
                                        .alert("Confirm?", isPresented: $confirm) {
                                            Button("OK", role: .cancel){
                                                confirmTime.append(time)
                                            }
                                            
                                            Button("Cancel", role:.destructive){}
                                        } message: {
                                            Text("Booking a meeting with \(name), on 12th June, at \(time)")
                                        }
             
                                }
                            }
                            
                            
                            Divider()
                        }
                    }.padding()
                } else {
                    VStack{
                        
                        
                        DatePicker(
                            "Select a Date for the meeting",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                        
                        Button(action: {
                            active = true
                        }) {
                            Text("Confirm")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination:LecturerDetails(name: name, image: image, desg: desg, dayCon: "12 June 2025" , dateSelected: .constant(true)) , isActive: $active){
                            EmptyView()
                            }
                        
                    }.padding()
                }
                
            }.frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Booking")
            .navigationBarTitleDisplayMode(.inline)
            
    }
}

#Preview {
    LecturerDetails(name: "sfdsfsdf", image: "chandula", desg: "dsfs", dayCon: "today", dateSelected: .constant(true))
}
