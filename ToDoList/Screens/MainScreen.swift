//
//  MainScreen.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI
import FirebaseAuth

struct MainScreen: View {
    @State private var authViewModel = AuthVm()
    
    var body: some View {
        if authViewModel.isSignedIn, !authViewModel.currentUserId.isEmpty {
            TabView {
                Home(userId: authViewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                Profile()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LogIn()
        }
    }
}
