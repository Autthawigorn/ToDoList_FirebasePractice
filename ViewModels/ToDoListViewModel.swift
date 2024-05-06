//
//  ToDoListViewModel.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showSheet = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
//    func updateOrder(items: [ToDoItem]) {
//      // Get a reference to the Firestore database
//      let db = Firestore.firestore()
//
//      // Batch write to optimize Firestore writes
//      let batch = db.batch()
//
//      // Loop through each item in the new order
//      for (index, item) in items.enumerated() {
//        let docRef = db.collection("users").document(userId).collection("todos").document(item.id)
//
//        // Create a Firestore update object with the new order field
//        let updateData = ["order": index]
//
//        // Add the update to the batch write
//        batch.updateData(updateData, forDocument: docRef)
//      }
//
//      // Commit the batch write to Firestore
//      batch.commit { error in
//        if let error = error {
//          print("Error updating order: \(error.localizedDescription)")
//        } else {
//          // Update succeeded (optional: handle success scenario)
//        }
//      }
//    }

}
