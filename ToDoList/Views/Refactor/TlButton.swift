//
//  TlButton.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 18/11/2025.
//

import SwiftUI

struct TlButton: View {
    let title: String
    let backGround: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10,)
                    .frame(height: 44)
                    .foregroundColor(backGround)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TlButton(title: "value", backGround: .pink) {
     //
    }
}
