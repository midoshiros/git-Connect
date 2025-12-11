//
//  signUp.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI

struct signUp: View {
    
  @State var vm = SignUpViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Sign Up", subtitle: "Start orgnaizing todos",
                       angle: -15, background: .orange)
            
            Form{
                
                TextField("Full Name", text: $vm.name)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                TextField("Email Address", text:  $vm.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $vm.password)
                
                TlButton(title: "Create Account", backGround: .indigo) {
                    vm.signUp()
                }
                
            }
            .offset(y: -15)
            
            
            Spacer()
            
        }
        
    }
}

#Preview {
    signUp()
}
