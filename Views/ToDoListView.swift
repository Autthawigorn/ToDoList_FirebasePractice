//
//  ToDoListView.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoItem]
    @State private var editableItems: [ToDoItem] = []
    
    init(userId: String) {
        //user/<id>/<todo>/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/" + userId + "/todos"
        )
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                }
                .onDelete { indexSet in
                    deleteItem(at: indexSet)
                }
                .onMove { indices, newOffset in
                    moveItem(from: indices, to: newOffset)
                }
//                .onDelete { deleteItem.remove(atOffsets: $0) }
//                .onMove { moveItem.move(fromOffsets: $0, toOffset: $1) }
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
    
    private func deleteItem(at offsets: IndexSet) {
        editableItems.remove(atOffsets: offsets)
    }
    
    private func moveItem(from source: IndexSet, to destination: Int) {
        editableItems.move(fromOffsets: source, toOffset: destination)
    }
    
}

#Preview {
    ToDoListView(userId: "tePKAmnz98UIEZx34bRZYQC75oD2")
}
