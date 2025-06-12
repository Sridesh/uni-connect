//
//  LecturerTile.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-11.
//

import SwiftUI

struct LecturerTile:View {
    let name:String
    let desg:String
    let image:String
    let today:Bool
    
    @State private var active = false
    
    var body: some View {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(50)
                    .padding(.vertical,0)
                    .foregroundColor(.black)
                
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 12))
                    .bold()
                    
                
                Text(desg)
                    .font(.system(size: 9))
                    .foregroundColor(.secondary)
                
                Divider()
                
                Button("Proceeed"){
                    active = true
                }
                NavigationLink(destination:LecturerDetails(name: name, image: image, desg: desg, dayCon: "today", dateSelected: .constant(today ? true:false)) , isActive: $active){
                    EmptyView()
                    }
            }.padding()
                .frame(width: 160, height: 220)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5)

    }
}

#Preview {
    LecturerTile(name: "Mr. O. K. G. C. Weerasekara", desg: "Consultant/Lecturer", image: "hall1", today: true)
}
