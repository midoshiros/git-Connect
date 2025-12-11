//
//  toDoItemVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 25/11/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
@Observable
class toDoItemVm {
   
    init () {}
    
    func toggleIsDone(item: ToDoitemModel){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
            
    }
    
   
    
    
}
