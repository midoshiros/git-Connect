//  signUpVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
import FirebaseFirestore
import FirebaseAuth
import Foundation

@Observable
class SignUpViewModel {
     var name = ""
     var email = ""
     var password = ""
    
    init() {}
    
    func signUp () {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
    
        guard let userID = result?.user.uid else { return }
        self?.insertUserRecord(id: userID) // takes user id
            
        }
    } // create the user & get the user id
    
    
    private func insertUserRecord(id: String){
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
       
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    } // get user id & store the user in data base
    
    
    private func validate() -> Bool{
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        
        return true
    }
}
