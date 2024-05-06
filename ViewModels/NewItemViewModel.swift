//
//  NewItemViewModel.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        
//        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return false
//        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    
    
    var isSaveDisabled: Bool {
        title.isEmpty
    }
    
    func resetDueDateToToday() {
        dueDate = Date()
    }
    
    
}
