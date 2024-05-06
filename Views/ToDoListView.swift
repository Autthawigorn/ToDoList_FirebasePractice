//
//  ToDoListView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoItem]
    
    @State private var selectedItem: ToDoItem?
    
    init(userId: String) {
        //user/<id>/<todo>/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/" + userId + "/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                HStack {
                                    Image(systemName: "trash")
                                    Text("Delete")
                                }
                            }
                            .tint(.red)
                            Button {
                                    // Another action
                                } label: {
                                    HStack {
                                        Image(systemName: "pencil")
                                        Text("Edit")
                                    }
                                }
                                .tint(.blue)
                        }
                }
            
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $viewModel.showSheet) {
            NewItemView()
        }
    }

    
}

#Preview {
    ToDoListView(userId: "tePKAmnz98UIEZx34bRZYQC75oD2")
}
