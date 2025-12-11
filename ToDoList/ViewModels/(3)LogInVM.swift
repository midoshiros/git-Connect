//
//  LogInVM.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import Foundation
import FirebaseAuth
@Observable
class LoginViewModel {
  
   var email    = ""
   var password = ""
   var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else{ return }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
   private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "please fill out all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        return true
    }
    
}
