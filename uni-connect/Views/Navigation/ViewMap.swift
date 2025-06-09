//
//  ViewMap.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-07.
//

import SwiftUI


struct Viewmap: View {
    @State private var option = "Ground Floor"
    @State private var showSheet = false
    @State private var isLecOn = true
    @State private var isPublicOn = true
    @State private var isAudiOn = true
    @State private var isCafeOn = true
    @State private var  isExtraOn = true
    
    var options = ["Ground Floor","Floor 1", "Floor 2", "Floor 3"]

    var body: some View {
        NavigationView{
            
            
            VStack(spacing: 20) {
                
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
                                    Toggle("Extra-curricular Facilities", isOn: $isExtraOn)
                                }.padding()
                                
                                Button("Reset") {
                                    isLecOn = true
                                    isAudiOn = true
                                    isCafeOn = true
                                    isExtraOn = true
                                    isPublicOn = true
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
                
                VStack{
                    NavigationLink(destination: LocationDetails()) {
                        Image(option).aspectRatio(contentMode: .fit)
                    }.buttonStyle(PlainButtonStyle())
                }.frame(maxWidth: .infinity)
                
                
            }
            .padding()
            .navigationTitle("View Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Viewmap()
}
