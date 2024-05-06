//
//  ProfileView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                if let user = viewModel.user {
                    profile(user: user)
                }   else {
                    Text("Loading Profile...")
                }
                
            }
            .onAppear{
                viewModel.fetchUser()
            }
            .navigationTitle("Profile")
            
            // Sign out
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showAlert = true
                    } label: {
                        HStack{
                            Text("Log Out")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .font(.system(size: 11))
                                .bold()
                        }
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Are you sure to log out?"),
                message: Text("Really dummy details sure to log out?"),
                primaryButton: .default(Text("Log Out")) {
                    viewModel.logOut()
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.secondary)
            .frame(maxWidth:.infinity, maxHeight: 88, alignment:.center)
            .fontWeight(.ultraLight)
            .padding()
        
        // Info: Name, Email, Member since
        
        HStack{
            Text("User Name: ")
            Spacer()
            Text(user.userName)
                .foregroundStyle(.secondary)
        }
        HStack{
            Text("Email: ")
            Spacer()
            Text(user.email)
                .foregroundStyle(.secondary)
        }
        HStack{
            Text("Member Since: ")
            Spacer()
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProfileView()
}
