//
//  AuthVm.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 19/12/2025.
//

import Foundation
import FirebaseAuth

@Observable
class AuthVm {
     var currentUserId: String = ""
     var isSignedIn: Bool = false
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        registerAuthStateHandler()
    }
    
    func registerAuthStateHandler() {
        authStateHandler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.isSignedIn = user != nil
            }
        }
    }
    
    deinit {
        if let handler = authStateHandler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
}
