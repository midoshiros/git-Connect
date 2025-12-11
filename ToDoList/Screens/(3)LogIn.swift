//  Created by Ahmad Hamdy on 16/11/2025.


import SwiftUI

struct LogIn: View {
    
    @State var vm = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                
                HeaderView(title: "To Do List", subtitle: "Get Things Done",
                           angle: 15, background: .indigo )
                Form{
                    
                    if !vm.errorMessage.isEmpty{
                        Text(vm.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $vm.email )
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $vm.password )
                    
                    TlButton(title: "Log In", backGround: .indigo) {
                        vm.login()
                    }
                }
                .offset(y: -40)
                
                VStack{
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: signUp())
                }
                .padding(.bottom, 30)

                Spacer()
            }
        }
    }
}

#Preview {
    LogIn()
}
