//
//  ToDoItemView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewModel()
    
    let item: ToDoItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item:item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22))
            }
        }
    }
}

#Preview {
    ToDoItemView(item: .init(
        id: "123",
        title: "Get Milk",
        dueDate: Date().timeIntervalSince1970,
        createDate: Date().timeIntervalSince1970,
        isDone: true
    ))
}
