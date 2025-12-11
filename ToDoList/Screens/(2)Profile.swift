//
//  Profile.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI

struct Profile: View {
    @State var vm = ProfileVm()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user =  vm.user {
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding(.bottom, 20)
                        
                        HStack{
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding(.bottom, 20)
                        
                        HStack{
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened) )")

                            
                        }
                        .padding(.bottom, 20)
                    }
                    .padding()
                    TlButton(title: "Log Out", backGround: .red) {
                        vm.logOut()
                    }
                    .frame(width: 240)
                }else{
                    Text("Loadin Profile")
                }
                
                
                
            }
            
            .navigationTitle("Profile")
        }
        
        .onAppear{
            vm.fetchUser()
        }
    }
}

#Preview {
    Profile()
}
 // @ViewBuilder   -> means func
