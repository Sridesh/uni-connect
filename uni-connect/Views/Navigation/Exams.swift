//
//  Exams.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-14.
//

import SwiftUI

struct ExamType :Identifiable {
    let id = UUID()
    let date:String
    let title:String
    let time:String
    let hall:String
}

let exams :[ExamType] = [
    ExamType(date: "01 June", title: "PDSA 2", time: "8.00am - 11.00am", hall: "Harisson Hall"),
    ExamType(date: "13 June", title: "ECS 3", time: "8.00am - 11.00am", hall: "Lecture Hall 08"),
    ExamType(date: "17 June", title: "TLSE", time: "8.00am - 11.00am", hall: "Auditorium"),
    ExamType(date: "21 June", title: "Data Science", time: "8.00am - 11.00am", hall: "Harisson Hall"),
]

struct Exams : View {
    
    
    var body: some View {
        VStack{
            VStack{
                Text("Upcoming Exams")
                    .font(.title2)
                    .frame(maxWidth:.infinity, alignment:.leading)
                    .foregroundColor(.blue.mix(with: .black, by: 0.3))
                    .bold()
                
                ScrollView{
                    VStack{
                        ForEach(exams){
                            item in
                            HStack{
                                HStack{
                                    Text(item.date)
                                        .foregroundColor(.secondary)
                                        .padding(10)
                                    Divider()
                                    VStack(alignment:.leading){
                                        Text(item.title)
                                            .font(.title2)
                                            .bold()
                                            .frame(maxWidth:.infinity, alignment:.leading)
                                        
                                        Text(item.time)
                                            .frame(maxWidth:.infinity, alignment:.leading)
                                        
                                        HStack{
                                            Text(item.hall
                                                )
                                            .foregroundColor(.gray)
                                           
                                            
                                            Image(systemName: "arrow.up.forward.app")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                    .padding(10)
                                    .frame(maxWidth:.infinity, alignment:.leading)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 150)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                }.padding()
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationTitle("My Exams")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    Exams()
}
