//
//  Elements.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 30/4/2567 BE.
//

import Foundation
import SwiftUI

struct CustomTextField {
    func textFieldWithStyle(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 10)
            
            TextField(title, text: text)
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
}
