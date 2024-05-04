//
//  MainView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//


import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //Already Signed in
                TabView {
                    ToDoListView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
        } else {
            LoginView()
        }
    
    }
}

#Preview {
    MainView()
}
