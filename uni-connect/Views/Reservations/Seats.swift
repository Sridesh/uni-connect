//
//  Seats.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

let locations:[String] = [
    "Library",
    "Study Area",
    "Cafetaria"
]

let serviceDataArr : [ServicesType] = [
    ServicesType(title:"Access to a large number of world renown books and researches", icon:"book.fill"),
    ServicesType(title:"Access to public PCs", icon:"laptopcomputer"),
    ServicesType(title:"Silent place to study", icon:"speaker.slash.fill"),
    ServicesType(title: "Conduct special lectures", icon: "graduationcap.fill")
]

struct Seats: View {
    @State private var selectedLocation:String = "Library"
    @State private var showSheet = false
    @State private var reserved = false

    var body : some View {
        NavigationView{
            //has to be fixed
            ZStack(alignment: .bottom){
                VStack(spacing: 0){
                    CustomDropDown(selectedOption: $selectedLocation, options: locations, icon: "chair.fill", title: "Select a public area")
                    if selectedLocation.isEmpty{
                        Text("Select a location above")
                            .font(.title)
                            .frame(maxHeight: .infinity)
                            
                    } else {
                        ScrollView{
                            Image("library")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth:.infinity, maxHeight:250)
                                .clipped()
                                .padding(.top)
                        
                                Text("Library")
                                    .font(.title)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                

                            HStack{
                                
                                Text("Open")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.green)
                                    .frame(maxWidth: .infinity)
                                
                                Divider()
                                
                                Text("Moderataley Crowded")
                           
                                    .bold()
                                    .foregroundColor(.orange)
                                    .frame(maxWidth: .infinity)
                                
                                Divider()
                                
                                VStack{
                                    Text("Open till")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.secondary)
                                    
                                    Text("4.30pm")
                                        .foregroundColor(.secondary)
                                }.frame(maxWidth: .infinity)
                            }.padding(.top)
                            
                            
                            VStack{
                                Text("Contact personel")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:25)
                                        .foregroundColor(.secondary)
                                    
                                    Text("Mrs. Varuni Perera")
                                        .bold()
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,5)
                                    
                                    Button("",systemImage:"envelope"){
                                        
                                    }
                                    
                                }.padding(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(10)
                                
                                HStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:25)
                                        .foregroundColor(.secondary)
                                    
                                    Text("Mrs. Asini Jayalath")
                                        .bold()
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,5)
                                    
                                    Button("",systemImage:"envelope"){
                                        
                                    }
                                    
                                }.padding(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(10)
                                    
                                    
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                            
                            
                            VStack{
                                Text("Services")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ForEach(serviceDataArr){
                                    item in
                                    HStack{
                                        Image(systemName: item.icon).foregroundColor(.secondary).frame(width: 50)
                                        Text(item.title)
                                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                                    Divider()
                                }
                                    
                            }.frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                        }
                    }
                }
                
                VStack{
                    Divider()
                    Button(action:{
                        showSheet = true
                    }){
                        Text(reserved ? "View Reservation":"Reserve a seating")
                    }
                    .padding(5)
                    .disabled(selectedLocation.isEmpty)
                    .sheet(isPresented: $showSheet){
                        SeatReservation( reserved: $reserved, open: $showSheet)
                    }
                }.background(Color.white)
            }
        }
        .padding()
        .navigationTitle("Seat Reservation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Seats()
}
