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
    @State private var logout = false
    
    @EnvironmentObject var session : UserSession
    
    func handleLogout(){
        session.isLogged = false
    }
    
    var body: some View {
        NavigationView{
            List{
                if session.isLogged{
                    VStack{
                        Image("profile")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(50)
                            .padding(.vertical,0)
                        
                        Text(session.name)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .bold()
                        
                        
                        Text(session.role.capitalized)
                            .foregroundColor(.secondary)
                        
                        Text(session.id.uppercased())
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
                } else {
                    Text("Please Login to use the Profile options")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                VStack{
                    if session.isLogged {
                        Button("Edit Profile"){
                            
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        Divider()
                        
                        Button(role:.destructive, action:handleLogout) {
                            Text("Logout")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .sheet(isPresented: $logout){
                            VStack{
                                Login()
                            }
                        }
                    }
                    else {
                        Button( action:{
                            
                            logout = !session.isLogged
                            
                        }) {
                            Text("Login")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .sheet(isPresented: $logout){
                            VStack{
                                Login()
                            }
                        }
                    }

                   
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationTitle("My Profile")
    }
}


#Preview {
    Profile()
        .environmentObject(UserSession())
}
