//
//  NewItem.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI

struct NewItem: View {
    
    @State var vm = NewItemVm()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 90)
            
            Form{
                TextField("Tilte", text:$vm.title)
                
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TlButton(title: "Save", backGround: .pink) {
                    if vm.canSave{
                        
                        vm.save()
                        newItemPresented = false
                        
                    } else {
                        vm.showAlert = true
                    }
                }

            }
            .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer.") )
            }
        }
    }
}

#Preview {
    NewItem(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
