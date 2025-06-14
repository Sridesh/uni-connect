//
//  Seats.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

let rooms:[String] = [
    "PC Lab 01",
    "PC Lab 02",
    "IOS Lab",
    "Network Lab"
]

let servicesArr : [ServicesType] = [
    ServicesType(title:"Access to latest Mac Computers", icon:"laptopcomputer"),
    ServicesType(title:"Full iOS development friendly echo systems", icon:"apple.logo"),
    ServicesType(title: "Conduct lectures", icon: "graduationcap.fill"),
]

struct PCs: View {
    @State private var selectedLocation:String = "IOS Lab"
    @State private var showSheet = false
    @State private var reserved = false

    var body : some View {
        NavigationView{
            //has to be fixed
            ZStack(alignment: .bottom){
                VStack(spacing: 0){
                    CustomDropDown(selectedOption: $selectedLocation, options: rooms, icon: "chair.fill", title: "Select a public area")
                    if selectedLocation.isEmpty{
                        Text("Select a location above")
                            .font(.title)
                            .frame(maxHeight: .infinity)
                            
                    } else {
                        ScrollView{
                            Image("mac")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth:.infinity, maxHeight:200)
                                .clipped()
                                .padding(.top)
                        
                                Text("IOS Lab")
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
                                
                                Text("Booked for lecture")
                           
                                    .bold()
                                    .foregroundColor(.red)
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
                                    
                                    Text("Mr. Kithnuka Perera")
                                        .bold()
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,5)
                                    
                                    Button("",systemImage:"phone"){
                                        
                                    }
                                    
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
                                    
                                    Text("Mr. Dihan Fernando")
                                        .bold()
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,5)
                                    
                                    Button("",systemImage:"phone"){
                                        
                                    }
                                    
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
                                
                                ForEach(servicesArr){
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
                        Text(reserved ? "View Reservation":"Reserve a device")
                    }
                    .padding(5)
                    .disabled(selectedLocation.isEmpty)
                    .sheet(isPresented: $showSheet){
                        PCReservation( reserved: $reserved, open: $showSheet)
                    }
                }.background(Color.white)
            }
        }
        .padding()
        .navigationTitle("PC Reservation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PCs()
}
