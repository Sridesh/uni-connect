//
//  Profile.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-12.
//

import SwiftUI

let actions = [
    "Meetings", "Seat Reservations", "PC Reservation"
]

let options = [
    "Privacy","Accessibility", "Settings"
]

struct Profile: View {
    var body: some View {
        NavigationView{
            List{
                VStack{
                    Image("profile")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(50)
                        .padding(.vertical,0)
                    
                    Text("L. S. H. Fernando")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                    
                    
                    Text("Student")
                        .foregroundColor(.secondary)
                    
                    Text("COBSCCOMP241P-001")
                        .foregroundColor(.secondary)
                }
                
                Section(header: Text("My Actions")){
                        ForEach(actions, id: \.self){
                            item in
                            HStack{
                                
                                Text(item)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                        }
                    
                }
                
                Section(header: Text("Account")){
                    ForEach(options, id: \.self){
                        item in
                        HStack{
                            
                            Text(item)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                VStack{
                    Button("Edit Profile"){
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    Button("Logout", role: .destructive){
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationTitle("My Profile")
    }
}


#Preview {
    Profile()
}
