//
//  LoginView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            loginBackground()
            
            VStack(spacing: 20)  {
                //Header
                VStack {
                    Text("To Do List")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("Get things done")
                        .font(.system(size: 24))
                        .foregroundStyle(.white.secondary)
                    
                }
                .padding(.top,60)
                
                
                //Login Form
                VStack(alignment: .leading, spacing: 10) {
                    
                    Group {
                        Text("Email")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.top, 20)
                        
                        TextField("Email Address", text: $email)
                            .frame(maxHeight: 44)
                            .padding(.horizontal)
                            .background(.thickMaterial)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.quinary)
                            )
                    }
                    
                    Group{
                        
                        Text("Password")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.top, 10)
                        
                        TextField("Password", text: $password)
                            .frame(maxHeight: 44)
                            .padding(.horizontal)
                            .background(.thickMaterial)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.quinary)
                            )
                    }

                  Button {
                    print("Login button pressed!")
                  } label: {
                    Text("Login")
                      .foregroundColor(.white)
                      .padding()
                      .frame(maxWidth: .infinity, maxHeight: 44)
                      .background(Color.blue)
                      .cornerRadius(10)
                  }
                  .padding(.vertical, 20)

                }
                .padding(.horizontal, 20)
                .background(.thinMaterial.opacity(1))
                .frame(maxWidth: 320)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
            }
            
            
            
            
            //Create Account
            

        }
    }
}



#Preview {
    LoginView()
}


