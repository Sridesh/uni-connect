//
//  LecturerLanding.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

struct LecturerLanding: View {

    var body: some View {
        NavigationView{
            VStack(){
                Text("Select when to schedule your meeting")
                    .font(.title).bold().padding(.bottom)
                
                NavigationLink(destination: Lecturers(today:true)){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Today")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title2)
                                .foregroundColor(.green.mix(with: .black, by:0.3))
                                .bold()
                                
                            
                            Text("Schedule a meeting today with lecturers who are currently in office")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.green.mix(with: .black, by:0.1))
                                .bold()
                        }
                        
                        
                        Divider()
                        
                        Image(systemName: "chevron.forward")
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: Lecturers(today:false)){
                    HStack{
                        
                        VStack{
                            Text("Later")
                                .font(.title2)
                                .foregroundColor(.blue.mix(with: .black, by:0.3))
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Schedule a meeting with a lecturer for a future date")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.blue.mix(with: .black, by:0.1))
                                .bold()
                            
                        }
                        
                        Divider()
                        
                        Image(systemName: "chevron.forward")
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 150)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }.frame(maxWidth: .infinity, alignment: .leading)
                }.padding().frame(maxHeight: .infinity, alignment: .top)
            
        }
        .padding()
        .navigationTitle("Lecturer Meetings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LecturerLanding()
}
