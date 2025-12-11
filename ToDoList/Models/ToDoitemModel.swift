//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import Foundation

struct ToDoitemModel: Codable, Identifiable {
    
    let id:      String
    let title:   String
    let dueDate: TimeInterval
    let created: TimeInterval
    var isDone:  Bool
    
    
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
