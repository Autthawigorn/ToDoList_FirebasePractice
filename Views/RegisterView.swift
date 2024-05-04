//
//  RegisterView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI


struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = RegisterViewModel()
   
    let customTextField = CustomTextField()
    let  customSecureField = CustomSecureField()
    
    var body: some View {
        NavigationStack {
            ZStack {
                registerBackground()
                
                ScrollView{
                    VStack(spacing: 40) {
                        
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.left")
                            }
                            .buttonStyle(CustomNavBarButton())
                            .frame(width: 60)
                            Spacer()
                        }
                        
                        //Header
                        VStack (spacing: 10) {
                            Text("To Do List")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundStyle(.white)
                            
                            Text("Create Account")
                                .font(.system(size: 24))
                                .foregroundStyle(.white.opacity(0.8))
                            
                        }
                        
                        //Register Form
                        VStack(alignment: .leading, spacing: 10) {
                            
                            if let isError = viewModel.errorMessage {
                                Text(isError)
                            }
                            
                            customTextField.textFieldWithStyle(title: "User Name", text: $viewModel.userName)
                            
                            customTextField.textFieldWithStyle(title: "Email Address", text: $viewModel.email)
                            
                            customSecureField.textFieldWithStyle(title: "Password", text: $viewModel.password)
                            
                            Button {
                                viewModel.register()
                            } label: {
                                Text("Register")
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
                            Text("Already have an account?")
                                .foregroundStyle(.secondary)
                            
                            Button("Login") {
                                dismiss()
                            }
                        }
                        
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                   
                }
            }
        }
        .navigationBarBackButtonHidden(true)
//        .toolbarBackground(.clear)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    dismiss()
//                } label: {
//                    Image(systemName: "arrow.left")
//                }
//                .buttonStyle(CustomNavBarButton())
//            }
//        }
        
        
    }
}

#Preview {
    RegisterView()
}
