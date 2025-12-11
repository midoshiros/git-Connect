//
//  MainScreen.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI

struct MainScreen: View {
    
    @State var vm = MainScreenVM()
    var body: some View {
        
        if vm.isSingedIn {
            TabView{
                Tab("Home", systemImage: "house"){
                    Home(userId: vm.userId)
                }
                
                Tab("Profile", systemImage: "person.circle"){
                    Profile()
                }
            }
        }
        
        else{
            LogIn()
        }
        
    }
}

#Preview {
    MainScreen()
}
