//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
