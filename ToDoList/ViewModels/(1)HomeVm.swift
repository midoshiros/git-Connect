//  HomeVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class HomeVm {
  
    var userId: String
    var showingNewItem = false
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
