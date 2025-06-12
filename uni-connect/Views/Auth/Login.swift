//
//  Login.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-12.
//

import SwiftUI

struct Login: View {
    @State private var email=""
    @State private var password=""
    @State private var showAlert = false
    @State private var navigate = false
    
    var body: some View {
        VStack{
            VStack{
                
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
                
                TextField("Email", text: $email)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .padding(.horizontal)

                       
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
                                    if email.isEmpty || password.isEmpty {
                                        showAlert = true
                                    } else {
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
                    
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .font(.headline)
                }
                .padding()
                
            }.padding()
                .frame(maxHeight: .infinity)
        }.frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    Login()
}
