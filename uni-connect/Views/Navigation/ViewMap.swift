//
//  ViewMap.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI

struct Indicator : Identifiable{
    let id = UUID()
    let color:Color
    let icon:String
    let x : CGFloat
    let y: CGFloat
    let type:String
    let name:String
}


struct Viewmap: View {
    @State private var option = "Ground Floor"
    @State private var showSheet = false
    @State private var isLecOn = true
    @State private var isPublicOn = true
    @State private var isAudiOn = true
    @State private var isCafeOn = true
    @State private var  isExtraOn = true
    @State private var  isWashOn = true
    
    var options = ["Ground Floor","Floor 1", "Floor 2", "Floor 3"]
    
    let indicators : [Indicator] = [
        Indicator(color: .blue, icon: "book.fill", x: 80, y: 100, type: "lec", name:"Lecture Hall 01"),
        Indicator(color: .blue, icon: "book.fill", x: 80, y: 200, type: "lec", name:"Lecture Hall 03"),
        Indicator(color: .pink, icon: "music.microphone", x: 300, y: 160, type: "audi", name:"Auditorium"),
        Indicator(color: .orange, icon: "figure.stand", x: 200, y: 240, type: "pub",name:"Library"),
        Indicator(color: .green, icon: "fork.knife.circle.fill", x: 200, y: 320, type: "caf",name:"Cafetaria"),
        Indicator(color: .purple, icon: "figure.indoor.soccer", x: 275, y: 500, type: "extra",name:"Cricket Room"),
        Indicator(color: .red, icon: "toilet.circle.fill", x: 80, y: 430, type: "wash",name:"Womens Lavotary"),
        
        Indicator(color: .red, icon: "toilet.circle.fill", x: 80, y: 500, type: "wash",name:"Mens Lavatory"),
    ]
    
    let indicators2 : [Indicator] = [
        Indicator(color: .blue, icon: "book.fill", x: 290, y: 480, type: "lec", name:"Lecture Hall 10"),
        Indicator(color: .blue, icon: "book.fill", x: 290, y: 240, type: "lec", name:"Lecture Hall 11"),
        Indicator(color: .pink, icon: "music.microphone", x: 300, y: 100, type: "audi", name:"Harisson Hall"),
        Indicator(color: .orange, icon: "figure.stand", x: 80, y: 100, type: "pub",name:"Study Area"),
        Indicator(color: .purple, icon: "figure.indoor.soccer", x: 100, y: 500, type: "extra",name:"Rotaract Center"),
        Indicator(color: .red, icon: "toilet.circle.fill", x: 120, y: 350, type: "wash",name:"Womens Lavotary"),
        
        Indicator(color: .red, icon: "toilet.circle.fill", x: 120, y: 280, type: "wash",name:"Mens Lavatory"),
    ]
    
    var filteredIndicators : [Indicator] {
        if option == "Ground Floor" {
            return indicators.filter{
                item in
                (isLecOn || item.type != "lec") &&
                (isCafeOn || item.type != "caf") &&
                (isAudiOn || item.type != "audi") &&
                (isPublicOn || item.type != "pub") &&
                (isExtraOn || item.type != "extra") &&
                (isWashOn || item.type != "wash")
            }
        } else {
            return indicators2.filter{
                item in
                (isLecOn || item.type != "lec") &&
                (isCafeOn || item.type != "caf") &&
                (isAudiOn || item.type != "audi") &&
                (isPublicOn || item.type != "pub") &&
                (isExtraOn || item.type != "extra") &&
                (isWashOn || item.type != "wash")
            }
        }
        }
        
        var body: some View {
            NavigationView{
                ScrollView{
                    VStack(spacing: 0) {
                        
                        CustomDropDown(selectedOption: $option, options:options,icon:"map", title: "")
                        
                        HStack{
                            Button("Filter") {
                                showSheet = true
                            }.frame(maxWidth: .infinity, alignment: .leading).padding()
                                .sheet(isPresented: $showSheet) {
                                    VStack {
                                        Text("Settings")
                                            .font(.headline)
                                            .padding()
                                        VStack{
                                            Toggle("Lecture Halls", isOn: $isLecOn)
                                            Toggle("Public Areas", isOn: $isPublicOn)
                                            Toggle("Auditoriums", isOn: $isAudiOn)
                                            Toggle("Cafetarias", isOn: $isCafeOn)
                                            Toggle("Lavatories", isOn: $isWashOn)
                                            Toggle("Extra-curricular Facilities", isOn: $isExtraOn)
                                        }.padding()
                                        
                                        Button("Reset") {
                                            isLecOn = true
                                            isAudiOn = true
                                            isCafeOn = true
                                            isExtraOn = true
                                            isPublicOn = true
                                            isWashOn = true
                                        }.padding()
                                        
                                        Button(action: {
                                            showSheet = false
                                        }) {
                                            Text("Done")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .frame(maxWidth: .infinity)
                                                .background(Color.blue)
                                                .cornerRadius(5)
                                        }
                                    }
                                    .padding()
                                    .presentationDetents([.height(400)])
                                }
                            
                            //                Text("Hello")
                            //                    .font(.subheadline)
                            //                    .padding(.horizontal, 12)
                            //                    .padding(.vertical, 6)
                            //                    .background(Color.gray.opacity(0.2))
                            //                    .foregroundColor(.black)
                            //                    .cornerRadius(16)
                            
                            
                        }
                        
                        ZStack{
                            //                        NavigationLink(destination: LocationDetails()) {
                            //                            Image(option).aspectRatio(contentMode: .fit)
                            //                        }.buttonStyle(PlainButtonStyle())
                            Image(option)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            ForEach(filteredIndicators){
                                item in
                                NavigationLink(destination: LocationDetails()) {
                                    VStack{
                                        Image(systemName: item.icon)
                                            .padding(10)
                                            .frame(width:40, height: 40)
                                            .background(item.color)
                                            .cornerRadius(50)
                                            .foregroundColor(.white)
                                        
                                        
                                        Text(item.name)
                                            .foregroundColor(.black)
                                            .bold()
                                    }.position(x:item.x, y:item.y)
                                }
                            }
                        }.frame(maxWidth: .infinity)
                    }
                }
                
                
            }
            .padding()
            .navigationTitle("View Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    
}

#Preview {
    Viewmap()
}
