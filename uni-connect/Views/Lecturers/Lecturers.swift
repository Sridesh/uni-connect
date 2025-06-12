//
//  Lecturers.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

let lecturerNames : [String] = [
    "Doc. T. P. Weerasinghe",
    "Ms. D. B. Hapuarachchi",
    "Mr. O, K. G. Weerasekara",
    "Ms. C. J. Rajapaksha",
    "Mr. D. P. Perera",
    "Ms. G. Ediriweera"
]

struct LecturerType : Identifiable{
    let id = UUID()
    let name :String
    let desg:String
    let image:String
}

let lecturers: [LecturerType] = [
    LecturerType(name: "Doc. T. P. Weerasinghe", desg: "Senior Lecturer", image: "thisara"),
    LecturerType(name: "Ms. D. B. Hapuarachchi", desg: "Lecturer", image: "bagya"),
    LecturerType(name: "Mr. O. K. G. Weerasekara", desg: "Assistant Lecturer", image: "gihan"),
    LecturerType(name: "Ms. C. J. Rajapaksha", desg: "Senior Lecturer", image: "chandula"),
    LecturerType(name: "Mr. D. P. Perera", desg: "Lecturer", image: "vimukthi"),
    LecturerType(name: "Ms. G. Ediriweera", desg: "Visiting Lecturer", image: "kavishna")
]

struct Lecturers: View {
    @State private var selected = 0
    @State private var searchText = ""
    
    let today : Bool
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {

            
          
            ScrollView{
                Text(today ? "Select a lecturer to book a meeting today":"Select a lecturer to schedule a meeting on an upcoming day"
                )
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(lecturers) { item in

                  
                                LecturerTile(name: item.name, desg: item.desg, image:item.image, today:today)
                            
                        
                    }
                }
                .padding()
            }
        .searchable(text: $searchText, prompt: "Search lecturer by name")
        .navigationTitle("Lecturers")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    Lecturers(today: true)
}
