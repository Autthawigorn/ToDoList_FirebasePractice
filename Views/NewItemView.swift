//
//  NewItemView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import SwiftUI

struct NewItemView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = NewItemViewModel()
    
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            
            Form{
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.graphical)
                    .onChange(of: viewModel.dueDate) { oldValue, newValue in
                        if viewModel.dueDate < Date().addingTimeInterval(-86400) {
                            showAlert = true
                        }
                    }
                
            }
            .navigationTitle("New Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
//                        viewModel.title = viewModel.title.trimmingCharacters(in: .whitespaces)
                        viewModel.save()
                       
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(viewModel.isSaveDisabled)
                }
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Invalid Due Date"),
                message: Text("Please select a due date that is today or newer"),
                dismissButton: .default(Text("OK")) {
                    viewModel.resetDueDateToToday()
                    showAlert = false
                }
            )
        }
    }
}

#Preview {
    NewItemView()
}
