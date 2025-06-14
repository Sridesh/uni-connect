//
//  SignUp.swift
//  uni-connect
//
//  Created by Sridesh 001 on 2025-06-14.
//

import SwiftUI

struct SignUp: View {
    @State private var id=""
    @State private var nic = ""
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password=""
    @State private var showAlert = false
    @State private var navigate = false
    
    var body: some View {
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
                
                //Form part
                VStack{
                    Text("Sign Up")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                    
                    TextField("Student Id", text: $id)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("NIC", text: $nic)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Full Name", text: $name)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Student Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Mobile Number", text: $phone)
                        .keyboardType(.phonePad)
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
                    
                    
                    Button(action: {
                        if id.isEmpty
                            || password.isEmpty
                            || id.isEmpty
                            || name.isEmpty
                            || email.isEmpty
                            || phone.isEmpty
                        {
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
                    }.padding(.vertical)
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.headline)
                        
                        NavigationLink(destination: Login()){
                            Text("Login")
                                .foregroundColor(.blue)
                                .font(.headline)
                            
                        }
                        
                    }.padding()
                    
                }.padding()
                    .frame(maxHeight: .infinity)
            }.frame(maxHeight: .infinity, alignment: .top)
        }
}

#Preview {
    SignUp()
}
