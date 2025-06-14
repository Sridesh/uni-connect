//
//  Navigation.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let destination: AnyView
}

struct NavigationHome: View {
    @EnvironmentObject var session : UserSession
    
    @State private var searchText = ""

    let locations = ["Harrsion Hall", "Auditorium", "Library", "Study Hall", "Lecture Hall 01", "Lecture Hall 2", "PC Lab 01", "PC Lab 02"]

    let menuItems: [MenuItem] = [
        MenuItem(title: "Naviagate to locations", icon: "map", destination: AnyView(Viewmap())),
        MenuItem(title: "Seat Reservation", icon: "square.split.2x2", destination: AnyView(Seats())),
        MenuItem(title: "PC Reservation", icon: "desktopcomputer.and.macbook", destination: AnyView(PCs())),
//        MenuItem(title: "View Halls", icon: "square", destination: AnyView(HallsView())),
        MenuItem(title: "Examinations", icon: "graduationcap", destination: AnyView(Exams()))
    ]

    var filteredLocations: [String] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var itemArr: [MenuItem] {
        session.isLogged ? menuItems : Array(menuItems.prefix(1))
    }

    var body: some View {
        NavigationStack{
            List {
                if searchText.isEmpty {
                    Section(header: Text("Featured")) {
                        ForEach(itemArr) { item in
                            NavigationLink(destination: item.destination) {
                                HStack {
                                    Image(systemName: item.icon)
                                        .foregroundColor(.blue)
                                        .frame(width: 24, height: 24)

                                    Text(item.title)
                                        .font(.body)

                                    Spacer()

                      
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }

                if !searchText.isEmpty {
                    Section(header: Text("Search Results")) {
                        if filteredLocations.isEmpty {
                            Text("No results found")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(filteredLocations, id: \.self) { location in
                                NavigationLink(destination: LocationDetails()){
                                    Text(location)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Facility Navigation")
            .searchable(text: $searchText, prompt: "Search any location")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
            .font(.largeTitle)
            .navigationTitle("Settings")
    }
}

#Preview {
    NavigationHome()
        .environmentObject(UserSession())
}

