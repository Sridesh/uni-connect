//
//  User.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-14.
//

import SwiftUI

class UserSession: ObservableObject{
    @Published var role : String = "student"
    @Published var id : String = "cobsccomp241p-001"
    @Published var name : String = "L S H Fernando"
    @Published var isLogged: Bool = true
}
