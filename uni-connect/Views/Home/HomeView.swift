//
//  HomeView.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

struct HomeView:View {
    @State private var isShowingSheet = false
    @State private var location = "Colombo"
    
    var body: some View {
        VStack{
         
                
                
                HStack{
                    Text("Campus Navigator")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 50)
                }.padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing)
                    )
            
            ScrollView{
                
                VStack{
                    Image(location == "Colombo" ? "nibm" : "kandy")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    HStack(alignment: .bottom){
                        Text(location == "Colombo" ? "NIBM World Wide, ":"NIBM Kandy Branch")
                            .font(.title)
                            .bold()
                        
                        Text(location == "Colombo" ? "Colombo":"Kandy")
                            .bold()
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text("You are currently accessing options available to \(location == "Colombo" ? "NIBM World Wide":"NIBM Kandy Branch")")
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button("Change Facility", action: {
                        isShowingSheet = true
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .actionSheet(isPresented: $isShowingSheet) {
                        ActionSheet(
                            title: Text("Change facility").font(.title2),
                            message: Text("Select the NIBM location which you want to access the services from"),
                            buttons:[
                                
                                .default(Text("NIBM Kirulapone - NIC"),
                                         action:{}),
                                .default(Text(location == "Colombo" ? "NIBM Kandy Branch" : "NIBM World Wide"),
                                         action:{
                                             if location == "Colombo" {
                                                 location="kandy"
                                             } else {
                                                 location = "Colombo"
                                             }
                                         }),
                                .default(Text("NIBM School of Business - Borella"),
                                         action:{}),
                                .default(Text("NIBM Galle"),
                                         action:{}),
                                .cancel()
                            ]
                        )}
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding()
                
                
                VStack{
                    Text("Features")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(alignment: .center){
                        Image(systemName: "location.circle")
                            .resizable()
                            .frame(width:30, height: 30)
                            .foregroundColor(.white)
                        
                        Text("Navigate and explore the facilities using our navigation features without ever getting lost")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [.red.opacity(0.6), .orange.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    
                    HStack(alignment: .center){
                        Image(systemName: "square.and.pencil.circle")
                            .resizable()
                            .frame(width:30, height: 30)
                            .foregroundColor(.white)
                        
                        Text("Reserve seatings and PCs for you using our reservation optimized features")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [.purple.opacity(0.6), .blue.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    
                    HStack(alignment: .center){
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width:30, height: 30)
                            .foregroundColor(.white)
                        
                        Text("Book a meeting with a lecturer from anywhere using out meeting booking features")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [.blue.opacity(0.6), .cyan.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    HomeView()
}
