//
//  LocationTile.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//
import SwiftUI

struct LocationTile: View {
    
    
    var body: some View {
        VStack(){
            Image("reservation").resizable().frame( height: 100).frame(maxWidth: .infinity).clipped()
            
            VStack{
                Text("Harisson Hall").bold()
                
                Text("Capacity: 100").foregroundStyle(Color.gray)
                
                Text("Floor: 1").foregroundStyle(Color.gray)
            }
            
            Divider()
            
            Button("View",action:{})
            
            Spacer()
        }.frame(width: 160).frame(height: 220).background(Color.white).cornerRadius(10).shadow(color: .black.opacity(0.2), radius: 5)
    }
}

#Preview {
    LocationTile()
}
