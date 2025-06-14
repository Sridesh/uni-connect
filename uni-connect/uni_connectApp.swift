//
//  uni_connectApp.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

@main
struct uni_connectApp: App {
    
    @StateObject var session = UserSession()
    @StateObject var bookings = Bookings()
    
    var body: some Scene {
        WindowGroup {
            TabsView()
                .environmentObject(session)
                .environmentObject(bookings)
        }
    }
}

#Preview {
    TabsView()
}
