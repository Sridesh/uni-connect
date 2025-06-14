//
//  Tabs.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI;

struct TabsView: View {
    @EnvironmentObject var session : UserSession
    
    @State private var selectedTab = 0
    var body: some View {
        
        ZStack{
            Color.white.ignoresSafeArea()
            
            TabView {
                
                HomeView().tabItem{Label("Home", systemImage:"house")}
                
                NavigationHome().tabItem{
                    Label("Navigation", systemImage: "location")
                }
                if session.isLogged {
                
                    LecturerLanding()
                        .tabItem{
                            Label("Lecturers", systemImage: "person.3.fill")
                        }
                    
                }
                
                
                if session.role == "lecturer" {
                    Meetings()
                        .tabItem{
                            Label("Meetings", systemImage: "calendar")
                        }
                }
                
                
                
                Profile()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
                
              
            }
            .background(Color.white)
        }.background(Color.white)
    }
}

#Preview {
    TabsView().environmentObject(UserSession()).environmentObject(Bookings())
}

