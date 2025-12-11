//
//  toDoItem.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 16/11/2025.
//

import SwiftUI

struct toDoItem: View {
    
    @State var vm = toDoItemVm()
    let item: ToDoitemModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title2)
                    
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date:.abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                vm.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    toDoItem(item: .init(id: "String",
                         title: "String",
                         dueDate: Date()
                                 .timeIntervalSince1970
                         ,
                         created: Date()
                                 .timeIntervalSince1970,
                         isDone:  false  ))
}
