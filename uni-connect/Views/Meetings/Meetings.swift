//
//  Meetings.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-14.
//

import SwiftUI

struct Meetings:View {
    @EnvironmentObject var bookings : Bookings
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Booked Meetings")
                    .font(.title)
                    .bold()
                    .foregroundColor(.blue.mix(with: .black, by: 0.3))
                
                VStack{
                    ForEach(bookings.meetings){
                        item in
                        HStack{
                            VStack{
                                HStack{
                                    Image(systemName: "calendar")
                                        .foregroundColor(.secondary)
                                    
                                    Text(item.date)
                                }
                                .padding(.bottom,5)
                                .frame(maxWidth:.infinity, alignment: .leading)
                                
                                HStack{
                                    Image(systemName: "clock")
                                        .foregroundColor(.secondary)
                                    
                                    Text(item.time)
                                }
                                .frame(maxWidth:.infinity, alignment: .leading)
                            }.frame(maxWidth:140, alignment: .leading)
                            
                            Divider()
                            
                            VStack{

                                Text(item.name)
                                .padding(.bottom,5)
                                .font(.headline)
                                .frame(maxWidth:.infinity, alignment: .leading)

                                Text(item.user)
                                    .frame(maxWidth:.infinity, alignment: .leading)
                         
                            }.frame(maxWidth:.infinity, alignment: .leading)
                            
                        }
                        .padding()
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .background(Color.purple.opacity(0.1))
                    }
                }
                .padding()
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .frame(maxHeight: .infinity, alignment: .top)
        }.navigationTitle("Meetings")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
    }
}


#Preview {
    Meetings()
        .environmentObject(Bookings())
}
