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
    let customTextField = CustomTextField()
    
    var body: some View {
        ZStack {
            loginBackground()
            
            ScrollView{
                VStack(spacing: 40)  {
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
                    .padding(.top,40)
                    
                    
                    //Login Form
                    VStack(alignment: .leading, spacing: 10) {
                        
                        customTextField.textFieldWithStyle(title: "Email Address", text: $email)
                        
                        customTextField.textFieldWithStyle(title: "Password", text: $password)
                        
                        Button {
                            //Attempt to Login
                        } label: {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 44)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.vertical, 20)
                        
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    .background(.thinMaterial.opacity(1))
                    .frame(maxWidth: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    //Create Account
                    VStack{
                        Text("New around here?")
                            .foregroundStyle(.secondary)
                        Button("Create Account"){
                            //SHow Registration
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}



#Preview {
    LoginView()
}


