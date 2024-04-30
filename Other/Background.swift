//
//  Background.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 30/4/2567 BE.
//

import SwiftUI

struct loginBackground: View {
    var body: some View {
        Image("loginBackground")
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.9)
    }
}

struct registerBackground: View {
    var body: some View {
        Image("registerBackground")
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.9)
    }
}

//#Preview {
//    loginBackground()
//}

#Preview {
    registerBackground()
}

