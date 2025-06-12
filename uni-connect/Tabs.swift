//
//  Tabs.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI;

struct TabsView: View {
    @State private var selectedTab = 0
    var body: some View {
        
        ZStack{
            Color.white.ignoresSafeArea()
            
            TabView {
                
                HomeView().tabItem{Label("Home", systemImage:"house")}
                
                NavigationHome().tabItem{
                    Label("Navigation", systemImage: "location")
                }
                
                LecturerLanding()
                    .tabItem{
                        Label("Lecturers", systemImage: "person.3.fill")
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
    TabsView()
}

