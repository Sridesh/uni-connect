//
//  Bookings.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-14.
//

import SwiftUI

struct BookingType : Identifiable {
    let id = UUID()
    let user : String
    let name : String
    let time : String
    let date : String
}

let bookings: [BookingType] = [
    BookingType(user: "student", name: "L. S. H. Fernando", time: "10:00 AM", date: "2025-06-15"),
    BookingType(user: "lecturer", name: "S. M. Weerakkodi", time: "02:00 PM", date: "2025-06-15"),
    BookingType(user: "student", name: "D. S. Williams", time: "11:30 AM", date: "2025-06-16"),
    BookingType(user: "lecturer", name: "A. R. Rahuman", time: "09:00 AM", date: "2025-06-17"),
    BookingType(user: "student", name: "W. D. Wijesuriya", time: "04:00 PM", date: "2025-06-17")
]


class Bookings: ObservableObject{
    @Published var meetings : [BookingType] = bookings
}
