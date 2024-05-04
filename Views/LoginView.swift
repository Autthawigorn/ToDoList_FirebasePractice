//
//  LoginView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    let customTextField = CustomTextField()
    let customSecureField = CustomSecureField()
    
    var body: some View {
        NavigationStack {
            ZStack {
                loginBackground()
                
                ScrollView {
                    VStack(spacing: 40) {
                        Spacer()
                        Spacer()
                        
                        //Header
                        VStack (spacing: 10) {
                            Text("To Do List")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundStyle(.white)
                            
                            Text("Login")
                                .font(.system(size: 24))
                                .foregroundStyle(.white.opacity(0.8))
                            
                        }
                        
                        //Login Form
                        VStack(alignment: .leading, spacing: 10) {
                            
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundStyle(.red)
                                    .font(.caption)
                            }
                            
                            customTextField.textFieldWithStyle(title: "Email Address", text: $viewModel.email)
                            
                            customSecureField.textFieldWithStyle(title: "Password", text: $viewModel.password)
                            
                            Button {
                                viewModel.login()
                            } label: {
                                Text("Login")
                            }
                            .buttonStyle(AccentButton())
                            .padding(.vertical, 20)
                            
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 30)
                        .background(.thinMaterial.opacity(1))
                        .frame(maxWidth: 440)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        

                        //Create Account
                        VStack{
                            Text("New around here?")
                                .foregroundStyle(.secondary)
                            
                            NavigationLink("Create Account", destination: RegisterView())
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                }
            }
        }
    }
}



#Preview {
    LoginView()
}


