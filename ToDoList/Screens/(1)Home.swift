//  ToDoListItems.swift
//  ToDoList

//  Created by Ahmad Hamdy on 16/11/2025.
// ToDoList View

import SwiftUI
import FirebaseFirestore

struct Home: View {
    @State var vm: HomeVm
    @FirestoreQuery var items: [ToDoitemModel]
    
    init(userId: String) {
        self._vm = State(initialValue: HomeVm(userId: userId))
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    toDoItem(item: item)
                        .swipeActions {
                            Button("Delete") {
                                vm.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    vm.showingNewItem = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
            .sheet(isPresented: $vm.showingNewItem) {
                NewItem(newItemPresented: $vm.showingNewItem)
            }
        }
    }
}

#Preview {
    Home(userId:"dwP1VmjFRETfSIseIk0L0tiUdFp1")
}
