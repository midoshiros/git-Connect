//
//  ProfileVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
import
FirebaseAuth
import FirebaseFirestore
import Foundation
@Observable

class ProfileVm {
    
    var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        
        guard let userId = Auth.auth().currentUser?.uid else{return}
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { [weak self]snapshot , error in
            guard let data = snapshot?.data(), error == nil  else {return}
            
            DispatchQueue.main.async {
                self?.user = User(id:      data["id"] as? String ?? "",
                                  name:    data["name"] as? String ?? "",
                                  email:   data["email"] as? String ?? "",
                                  joined:  data["joined"] as? TimeInterval ?? 0)
                }
        }
        
        
    }
    
    func logOut() {
        
        do {
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
    
}
// ui updates must happen in main thread
//fetching user
// sign state  - getting user id -> logic   --for latency Home not depending on it if alredy signed

/*
 Main Thread: The special thread responsible for all UI updates and user interactions
 Background Threads: Other threads that handle heavy work like network requests, database queries, file operations
 */
