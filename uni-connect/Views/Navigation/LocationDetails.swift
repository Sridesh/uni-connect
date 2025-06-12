//
//  LocationDetails.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-09.
//

import SwiftUI


struct LocationDetails: View {
    @State private var shown = true
    @State private var selected = 0
    
    let options = ["Overview", "Navigation", "Crowd", "Services"]
    
    
    var body: some View {
        VStack {
                    Image("hall1")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .onAppear
                {
                    shown = true
                }
                .sheet(isPresented: $shown) {
                    VStack {
                        VStack(alignment: .leading){
                            Text("Auditorium")
                                .bold()
                                .font(.title2)
              
                            
                            Text("Open today")
                                .foregroundColor(.green)
                                
                            Text("TSLE - COBSCCOMP")
                                .foregroundColor(.secondary)
                            
                            Text("Heavily Crowded")
                                .foregroundColor(.secondary)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.gray.opacity(0.07))
                        
                        VStack{
                            Picker("Options", selection: $selected) {
                                        ForEach(0..<options.count, id: \.self) { index in
                                            Text(options[index]).tag(index)
                                        }
                                    }
                                    .pickerStyle(.segmented)
                            ScrollView{
                                if selected == 0 {
                                    LocationOverview()
                                }
                                
                                else if selected == 1 {
                                    LocationNavigation()
                                }
                                
                                else if selected == 2 {
                                    CrowdLevel()
                                }
                                else if selected == 3{
                                    Services()
                                }
                            }
                               
                            
          
                        }
                        .padding()
                        .padding(.top,0)
                        
                                                
                       
                        
                        Spacer()
                    }
                    .presentationDetents([.height(550)])
                    .presentationDragIndicator(.visible)
                }
                .navigationTitle("View Map")
                .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LocationDetails()
}


struct View1: View {
    var body: some View {
        Text("View 1")
    }
}

struct View2: View {
    var body: some View {
        Text("View 2")
    }
}
