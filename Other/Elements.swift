//
//  Elements.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 30/4/2567 BE.
//

import SwiftUI

//-------------------- Text Field Style -----------------------

struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 44)
            .padding(.horizontal)
            .background(Color.secondary)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.quinary, lineWidth: 1)
            )
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldStyle())
    }
}

//--------------------------------------------------------------


struct CustomTextField {
    func textFieldWithStyle(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 10)
            
            TextField(title, text: text)
                .modifier(CustomTextFieldStyle()) // Use directly skiping extension View
                .autocorrectionDisabled()
                .autocapitalization(.none)
        }
    }
}


struct CustomSecureField {
    func textFieldWithStyle(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 10)
            
            SecureField(title, text: text)
                .customTextFieldStyle() // try use the extension
        }
    }
}

//--------------------------------------------------------------

struct CustomNavBarButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary.opacity(0.6))
            .bold()
            .frame(minWidth: 60, maxWidth: .infinity)
            .frame(height: 30)
            .background(.thinMaterial)
            .cornerRadius(10)
    }
}


struct AccentButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color.blue)
            .cornerRadius(10)
    }
}
