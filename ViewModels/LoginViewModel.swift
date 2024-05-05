//
//  LoginViewModel.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

//import FirebaseAuth
//import Foundation
//
//class LoginViewModel : ObservableObject {
//    
//    @Published var email = ""
//    @Published var password = ""
//    @Published var errorMessage = ""
//    
//    init() {}
//    
//    func login() {
//        guard validate() else {
//            return
//        }
//        
//        // Try login
//        Auth.auth().signIn(withEmail: email, password: password)
//     
//    }
//    
//   private func validate() -> Bool {
//        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, 
//                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
//            
//            errorMessage = "*Please fill in all fields."
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
//       print("Called")
//       return true
//       
//    }
//    
//}

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validateInput() else {
            return
        }
        
        // Attempt login
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func validateInput() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

