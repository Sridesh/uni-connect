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
                    VStack(alignment: .leading){
                        Text("Today")
                            .font(.title2)
                            .foregroundColor(.green.mix(with: .black, by:0.3))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Schedule a meeting today with lecturers who are currently in office")
                            .foregroundColor(.green.mix(with: .black, by:0.1))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                NavigationLink(destination: Lecturers(today:false)){
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
                        
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
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
