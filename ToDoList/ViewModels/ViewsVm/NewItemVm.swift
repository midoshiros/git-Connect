//
//  NewItemVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class NewItemVm {
    var title = ""
    var dueDate = Date()
    var showAlert = false
    
    init () {

    }
    
    func save() {
        guard canSave else {return}
        guard let uId = Auth.auth().currentUser?.uid else {return}
        
        let newId = UUID().uuidString
        let newItem = ToDoitemModel(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   created: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {return false }
        guard dueDate >= Date().addingTimeInterval(-86400) else {return false }
        
        return true
    }
    
}
