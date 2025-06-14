//
//  Login.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-12.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var session : UserSession
    
    @State private var id=""
    @State private var password=""
    @State private var showAlert = false
    @State private var navigate = false
    
    func handleLogin() {
        session.isLogged = true
        session.role = "student"
        
        if id == "cobsccomp241p-001" {
            session.role = "student"
        } else {
            session.role = "lecturer"
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    HStack{
                        Text("Campus Navigator")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 50)
                    }.padding()
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing)
                )
                
                VStack{
                    
                    Text("Login")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    
                    TextField("Student Id", text: $id)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding()
                    
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    
                    Text("Forgot Password")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                    
                    
                    Button(action: {
                        if id.isEmpty || password.isEmpty {
                            showAlert = true
                        } else {
                            handleLogin()
                            navigate = true
                        }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .alert("Please fill in all fields", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    HStack{
                        Text("Do not have an account?")
                            .font(.headline)
                        NavigationLink(destination: SignUp()){
                            
                            
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .font(.headline)
                            
                        }
                        
                    }.padding()
                    
                }.padding()
                    .frame(maxHeight: .infinity)
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    Login()
        .environmentObject(UserSession())
}
