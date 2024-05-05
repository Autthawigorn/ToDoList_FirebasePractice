//
//  RegisterViewModel.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

//import FirebaseAuth
//import Foundation
//import FirebaseFirestore
//
//class RegisterViewModel : ObservableObject {
//    
//    @Published var userName = ""
//    @Published var email = ""
//    @Published var password = ""
//    @Published var errorMessage: String?
//    
//    init() {}
//    
//    func register() {
//        guard validate() else {
//            return
//        }
//        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//            guard let userId = result?.user.uid else {
//                return
//            }
//            self?.insertUserRecord(id: userId)
//        }
//    }
//    
//    private func insertUserRecord(id: String) {
//        let newUser = User(id: id,
//                           userName: userName,
//                           email: email,
//                           joined: Date().timeIntervalSince1970)
//        
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(id)
//            .setData(newUser.asDictionary())
//    }
//    
//    private func validate() -> Bool {
//        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty,
//              !email.trimmingCharacters(in: .whitespaces).isEmpty,
//              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return false
//        }
//        
//        // email@theart.com
//       guard let atIndex = email.firstIndex(of: "@"),
//             let dotIndex = email.firstIndex(of: "."),
//             atIndex < dotIndex,  // "@" comes before "."
//             email[email.index(after: atIndex)..<dotIndex].count >= 1 else {  // At least one character between "@" and "."
//           errorMessage = "*Please enter a valid email format (e.g. example@email.com)."
//           return false
//       }
//        
//        guard password.count >= 6 else {
//            return false
//        }
//        
//        return true
//    }
//}


import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    
    init() {}
    
    func register() {
        guard validateInput() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                }
                return
            }
            self?.insertUserRecord(userID: userId)
        }
    }
    
    private func insertUserRecord(userID: String) {
        let newUser = User(id: userID,
                           userName: userName,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .setData(newUser.asDictionary())
    }
    
    private func validateInput() -> Bool {
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long."
            return false
        }
        
        return true
    }
    
    // email@theart.com
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
