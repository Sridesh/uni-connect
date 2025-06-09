//
//  Tabs.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI;

struct TabsView: View {
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            
            TabView {
                
                NavigationHome().tabItem{
                    Label("Navigation", systemImage: "location")
                }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }.background(Color.white)
    }
}
struct ProfileView: View {
    var body: some View {
        NavigationView {
            Text("Profile Screen")
                .navigationTitle("Profile")
        }
    }
}

#Preview {
    TabsView()
}

