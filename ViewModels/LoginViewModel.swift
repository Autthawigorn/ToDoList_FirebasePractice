//
//  LoginViewModel.swift
//  ToDoList_FirebasePractice
//
//  Created by Autthawigorn Yortpiboot on 29/4/2567 BE.
//

import FirebaseAuth
import Foundation

class LoginViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try login
        Auth.auth().signIn(withEmail: email, password: password)
     
    }
    
   private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, 
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "*Please fill in all fields."
            return false
        }
        
        // email@theart.com
       guard let atIndex = email.firstIndex(of: "@"),
             let dotIndex = email.firstIndex(of: "."),
             atIndex < dotIndex,  // "@" comes before "."
             email[email.index(after: atIndex)..<dotIndex].count >= 1 else {  // At least one character between "@" and "."
           errorMessage = "*Please enter a valid email format (e.g. example@email.com)."
           return false
       }
       
       print("Called")
       return true
       
    }
    
}
